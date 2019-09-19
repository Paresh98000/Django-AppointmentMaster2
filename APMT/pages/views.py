from .paytm import checksum
from django.shortcuts import render,redirect
from pages.models import client,appointment,sp,admin,service
from django.db.models import Q
from django.views.decorators.csrf import csrf_exempt

MERCHANT_KEY = "TsmOJd40100529105511"
#from django.forms import UploadFileForm

issp = False
isadmin = False

def upload(f,folder):
	import os
	print('path: ',os.getcwd())
	path = "." #os.getcwd()
	path += '\\pages\\static\\images\\'
	path += str(folder)
	path += '\\'
	print(path)
	print(os.path.exists(path))
	file_iter = os.walk(path)
	curd,folders,files = next(file_iter)
	print('\n',curd,folders,files,'\n')
	imageid = len(files)+1
	with open(path+f.name,'wb+') as destination:
		for chunk in f.chunks():
			destination.write(chunk)


def qry(str):
	import MySQLdb as sql
	global cur,con
	con = sql.connect(user='root',password='',database='AppointmentMaster')
	cur = con.cursor()
	return cur.execute(str),cur

def getusername(req):
	
	global issp,isadmin

	try:
		clientid = req.COOKIES['userid']
	except:
		clientid = None

	try:
		spid = req.COOKIES['spid']
	except:
		spid = None

	try:
		adminid = req.COOKIES['adminid']
	except:
		adminid = None

	if clientid != None and clientid != '' and clientid != 'None':

		row,c = qry("select name from pages_client where id = {}".format(clientid))
		
		if row>0:
			issp = False
			isadmin = False
			return c.fetchone()[0]
		else:
			return None

	elif spid != None and spid != '' and spid != 'None':

		issp = True
		isadmin = False
		row,c = qry("select name from pages_sp where id = {}".format(spid))
		abc = c.fetchone()
		print(abc)
		if row>0:
			return abc[0]
		else:
			return None

	else:
		
		if adminid != None and adminid != '' and adminid != 'None':
			issp = False
			isadmin = True
			print('\n\n',"select username from pages_admin where id = {}".format(adminid),'\n\n')
			row,c = qry("select username from pages_admin where id = {}".format(adminid))
			if row>0:
				return c.fetchone()[0]
			else:
				return None
		else:
			return None
		

def usercheck_profiling(req,html,userneed=False,data={}):
	global issp,isadmin
	user = getusername(req)
	#print(user)

	services = []
	cities = []

	rows,cur = qry('select * from serviceType;')
	if rows:
		services = cur.fetchall()
	row,c = qry('select * from city')
	if rows:
		cities = c.fetchall()

	row,objes=qry('select distinct stype from pages_service')
	list_of_sers = []
	if row > 0:
		obj = objes.fetchall()
		for x in obj:
			list_of_sers.append(x[0])

	if user==None:
		print(user)
		if not userneed:
			data.update({'profile_visibility': 'none','register_visibility':'block','user_name':None,'issp':issp,'isadmin':isadmin,'total_client':client.objects.count(),'obj_ser':service.objects.all(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count(),'service_types':list_of_sers,'services':services,'city':cities})
			return render(req,html,data)
		else:
			return redirect('/homepage')
	else:
		data.update({'profile_visibility': 'block','register_visibility':'none','user_name':user,'issp':issp,'isadmin':isadmin,'total_client':client.objects.count(),'obj_ser':service.objects.all(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count(),'service_types':list_of_sers,'services':services,'city':cities})
		return render(req,html,data)

#		                   *
## Pages starts from here \*/
#                          *

def logout(req):

	row,objes = qry('select distinct stype from pages_service')
	list_of_sers = []

	if row > 0:
		obj = objes.fetchall()
		for x in obj:	
			list_of_sers.append(x[0])

	stype = []
	cities = []
	

	rows,cur = qry('select * from serviceType;')
	if rows:
		services = cur.fetchall()
	row,c = qry('select * from city')
	cities = c.fetchall()
    
	
	res = redirect('/')
	try:
		res.set_cookie('userid','')
		res.set_cookie('spid','')
		res.set_cookie('adminid','')
	except Exception as e:
		print('\n\n',e)
	return res

def home(request):
	
	city = []
	doccity = []
	bcity = []
	subtype = []

	for x in service.objects.filter(status="Active"):
		city.append(x.city)
		subtype.append(x.stype)

	for x in service.objects.filter(status="Active",stype="Business"):
		bcity.append(x.city)

	for x in service.objects.filter(status="Active",stype="Doctor"):
		doccity.append(x.city)

	city = set(city)
	subtype = set(subtype)
	bcity = set(bcity)
	doccity = set(doccity)

	print('\n\n doccity: ',doccity,'\n\n')
	return usercheck_profiling(request,'home.html',False,{'city_box':city,'doc_city':doccity,'obj_ser':service.objects.all(),'objects_s':service.objects.all(),'busi_ser_city':bcity})
	

def clientSignup(request):
	
	row,objes=qry('select distinct stype from pages_service')
	list_of_sers = []
	if row > 0:
		obj = objes.fetchall()
		for x in obj:
			print(x)
			list_of_sers.append(x[0])


	username = getusername(request)

	if request.method == 'GET':
		row,c = qry('select * from city')
		cities = c.fetchall()
		#print(cities)
		
		if username == None:
			return render(request,'.\\login\\usersignupform.html',{'obj_ser':service.objects.all(),'profile_visibility': 'none','register_visibility':'block','city':cities,"user_name":None,'total_client':client.objects.count(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count(),'service_types':list_of_sers})
		else:
			print('\n\n username: ',username)
			return render(request,'.\\login\\usersignupform.html',{'profile_visibility': 'block','obj_ser':service.objects.all(),'register_visibility':'none','city':cities,"user_name":username,'total_client':client.objects.count(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count(),'service_types':list_of_sers})
	else:			
		c1 = client(id=(client.objects.count()+1),name=request.POST['name'],city=request.POST['location'],email=request.POST['email_id'],phone_no=request.POST['mobile'],password=request.POST['password'],gender=request.POST['gender'])
		#print("\n\n insert: ",c1.save(),"\n\n")
		c1.save()
		responce = redirect('/client/dashboard')
		responce.set_cookie("userid",c1.id)
		return responce
		

def signin(request):

	row,objes=qry('select distinct stype from pages_service')
	list_of_sers = []
	if row > 0:
		obj = objes.fetchall()
		for x in obj:	
			list_of_sers.append(x[0])

	login_error = None
	username = getusername(request)
	if request.method == 'GET':
		if username == None:
			return usercheck_profiling(request,r'login\userlogin.html',False,{'profile_visibility': 'none','obj_ser':service.objects.all(),'register_visibility':'block',"user_name":None,'total_client':client.objects.count(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count(),'service_types':list_of_sers})
		else:
			x = usercheck_profiling(request,r'.\login\userlogin.html',True,{'profile_visibility': 'block','obj_ser':service.objects.all(),'register_visibility':'none',"user_name":username,'total_client':client.objects.count(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count(),'service_types':list_of_sers})
			
			print('\n\n username: ',username)
			return x
	else:
		usr = client.objects.filter(name=request.POST["uname"],password=request.POST['password'])
		username = None
		if len(usr)>0:
			print('\n\n',username)
			username = usr[0].name
			
		else:
			login_error=' *username or password is wrong '
			username = None

		if username == None:
			res = render(request,r'login\userlogin.html',{'profile_visibility': 'none','obj_ser':service.objects.all(),'register_visibility':'block',"user_name":None,"login_error":login_error})
			res.set_cookie('userid','')
			return res
		else:

			print('\n\n username: ',usr[0].id,username,'logged in')
			x = redirect('/client/dashboard')
			x.set_cookie('adminid','')
			x.set_cookie('spid','')
			x.set_cookie('userid',usr[0].id)
			return x

def SPSignup(request):

	username = getusername(request)

	if request.method == 'GET':
		
		row,c = qry('select * from city')
		cities = c.fetchall()
		#print(cities)
		
		if username == None:
			return usercheck_profiling(request,'.\\login\\serviceprovidersignupform.html',False,{'profile_visibility': 'none','obj_ser':service.objects.all(),'register_visibility':'block','city':cities,"user_name":None,'total_client':client.objects.count(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count()})
		else:
			print('\n\n username: ',username)
			return usercheck_profiling(request,'.\\login\\serviceprovidersignupform.html',True,{'profile_visibility': 'block','obj_ser':service.objects.all(),'register_visibility':'none','city':cities,"user_name":username,'total_client':client.objects.count(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count()})
	else:			
		
		sp1 = sp(id=(sp.objects.count()+1),name=request.POST['name'],city=request.POST['location'],email=request.POST['email_id'],phone_no=request.POST['phone_no'],password=request.POST['password'])
		#print("\n\n insert: ",c1.save(),"\n\n")
		sp1.save()
		responce = redirect('/sp/dashboard')
		responce.set_cookie('userid','')
		responce.set_cookie('adminid','')
		responce.set_cookie("spid",sp1.id)
		return responce
		

def SPLogin(request):

	print('\n\n sp objects ----------',sp.objects.all(),'\n\n')
	login_error = None
	username = getusername(request)
	if request.method == 'GET':
		if username == None:
			return usercheck_profiling(request,'.\\login\\serviceproviderlogin.html',False,{'profile_visibility': 'none','obj_ser':service.objects.all(),'register_visibility':'block',"user_name":None,'total_client':client.objects.count(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count()})
		else:
			print('\n\n username: ',username)
			return usercheck_profiling(request,'.\\login\\serviceproviderlogin.html',True,{'profile_visibility': 'block','obj_ser':service.objects.all(),'register_visibility':'none',"user_name":username,'total_client':client.objects.count(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count()})
	else:
		usr = sp.objects.filter(name=request.POST["uname"],password=request.POST['password'])
		username = None
		if len(usr)>0:
			username = usr[0].name			
		else:
			login_error=' *username or password is wrong '
			username = None

		if username == None:
			res = render(request,'.\\login\\serviceproviderlogin.html',{'profile_visibility': 'none','obj_ser':service.objects.all(),'register_visibility':'block',"user_name":None,"login_error":login_error,'total_client':client.objects.count(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count()})
			return res
		else:
			print('\n\n username: ',username,'logged in')
			res = redirect('/sp/dashboard')
			res.set_cookie('spid',usr[0].id)
			res.set_cookie('userid','')
			res.set_cookie('adminid','')
			return res

def adminLogin(request):
	login_error = None
	htmlurl = r'login\adminlogin.html'
	username = getusername(request)
	if request.method == 'GET':
		if username == None:
			return usercheck_profiling(request,htmlurl,False,{'profile_visibility': 'none','register_visibility':'block','obj_ser':service.objects.all(),"user_name":None,'total_client':client.objects.count(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count()})
		else:
			print('\n\n username: ',username)
			return usercheck_profiling(request,htmlurl,True,{'profile_visibility': 'block','register_visibility':'none','obj_ser':service.objects.all(),"user_name":username,'total_client':client.objects.count(),'total_sp':sp.objects.count(),'total_appointment':appointment.objects.count(),'total_service':service.objects.count()})
	else:

		usr = admin.objects.filter(username=request.POST["name"],password=request.POST['password'])
		username = None

		if len(usr)>0:

			username = usr[0].username

		else:

			login_error = ' *username or password is wrong '
			username = None

		if username == None:

			res = render(request,htmlurl,{'profile_visibility': 'none','register_visibility':'block','obj_ser':service.objects.all(),"user_name":None,"login_error":login_error})
			res.set_cookie('adminid','')
			return res

		else:

			print('\n\n username: ',username,'logged in')
			res = redirect('/admin_login/dashboard')
			res.set_cookie('adminid',usr[0].id)
			res.set_cookie('userid','')
			res.set_cookie('spid','')

			return res

def about(request):
	return render(request,'about.html',{})

def contact(request):
	return render(request,'contact.html',{})

def clientdashboard(request):
	if request.method == 'GET':
		print("\n\n clientdashboar cookies: ",request.COOKIES['userid'],'\n\n')
		return usercheck_profiling(request,'userdashboard.html',True)
	else:
		return usercheck_profiling(request,'userdashboard.html',True)

def cpf(request):
	return None

def spdashboard(request):
	if request.method == 'GET':
		return usercheck_profiling(request,'spdashboard.html',True)
	else:
		return usercheck_profiling(request,'spdashboard.html',True)

def appointments(request):
	
	if request.COOKIES['userid'] == None or request.COOKIES['userid'] == '':
		return redirect(request.get_full_path())

	if request.method=="POST":
		pd = request.POST
		obj = appointment(id=(appointment.objects.count()+1),clientid=client.objects.filter(id=request.COOKIES['userid'])[0],serviceid=service.objects.filter(id=pd['serid'])[0],description=pd['detail'],date=pd['date'],time=pd['time'])
		obj.save()
		
		return redirect('/homepage')
		
	return render(request,'appointment.html',{})

def notification(request):	
	return render(request,'notification.html',{})

def admindashboard(request):
	if request.method == 'GET':
		return usercheck_profiling(request,'admindashboard.html',True)
	else:
		return usercheck_profiling(request,'admindashboard.html',True)

def clientprofile(request):
	pass

def spprofile(request):
	pass

def newservice(request):
	
	if request.method == 'GET':

		usr = usercheck_profiling(request,'newservice.html',True)
		print(usr)
		if usr != None:
			return usr
		else:
			return redirect('/homepage')

	else:
		
		spid = request.COOKIES["spid"]
		dd = request.POST
		print(spid)
		stype = dd['stype']
		if dd['stype'] == 'Other':
			rows,c = qry("select * from servicetype")
			del c
			row,cur = qry('insert into servicetype (id,name) values({},{})'.format(rows+1,dd['other_stype']))
			del cur
			if row > 0:
				print('service type : ',dd['other_stype'],' inserted successfully ')
			stype = dd['other_stype']
		
		f1 = request.FILES['profile']
		upload(f1,'sp')

		newobj = service(id=service.objects.count()+1,image=f1.name,providerid=sp.objects.filter(id=spid)[0],title=dd['title'],time_start_h=dd['time_s_h'],time_start_m=dd['time_s_m'],time_end_h=dd['time_e_h'],time_end_m=dd['time_e_m'],city=dd['location'],location=dd['address'],day=dd['days'],description=dd['detail'],status="Pending",stype=dd['stype'],phone_no=dd['phone_no'],cost=request.POST['cp'])
		newobj.save()
		return redirect('/sp/dashboard')

def manageservice(request):

	if request.method == 'GET':
		s = request.COOKIES['spid']
		return usercheck_profiling(request,'manageservice.html',True,{'service':service.objects.filter(providerid=s)})
	else:
		return usercheck_profiling(request,'manageservice.html',True)

def editservice(request):
	
	if request.method == 'GET':
		
		spid = request.GET['serid']
	
		sobj = service.objects.filter(id=spid)
	
		if len(sobj) > 0 :

			day = ["","",""]

			if sobj[0].day == 'Mon - Sat':
				day[0] = "selected"
			elif sobj[0].day == 'Mon - Fri':
				day[1] = "selected"
			else:
				day[2] = "selected"

			return usercheck_profiling(request,'editservice.html',True,{'s':sobj,'d':day})
		else:
			return redirect('/sp/dashboard')
	else:

		serid = request.POST['serid']
		print('\n\n\n\n',serid)
		if serid == None or serid == '':
			return redirect('/sp/dashboard')
		
		spid = request.COOKIES["spid"]
		dd = request.POST
		
		print(spid)
		
		stype = dd['stype']
		
		if dd['stype'] == 'Other':
			rows,c = qry("select * from servicetype")
			del c
			row,cur = qry('insert into servicetype (id,name) values({},{})'.format(rows+1,dd['other_stype']))
			del cur
			if row > 0:
				print('service type : ',dd['other_stype'],' inserted successfully ')
			stype = dd['other_stype']

		print('\n\n\n---- ',serid)
		newobj = service(id=serid,providerid=sp.objects.get(id=spid),title=dd['title'],time_start_h=dd['time_s_h'],time_start_m=dd['time_s_m'],time_end_h=dd['time_e_h'],time_end_m=dd['time_e_m'],city=dd['location'],location=dd['address'],day=dd['days'],description=dd['detail'],image='',stype=dd['stype'],phone_no=dd['phone_no'],cost=dd['cost'],status="Pending")
		newobj.save()
		print(newobj)

		#newobj =  service(id=serid,providerid=spid,title=dd['title'],time_start_h=dd['time_s_h'],time_start_m=dd['time_s_m'],time_end_h=dd['time_e_h'],time_end_m=dd['time_e_m'],city=dd['location'],location=dd['address'],day=dd['days'],description=dd['detail'],image='',status="Pending",stype=dd['stype'],phone_no=dd['phone_no'])
		#newobj.save()

		return redirect('/sp/dashboard')

def deleteservice(request):

	if request.method == 'GET':
		obj = service.objects.filter(id=request.GET['serid'])
		obj.delete()
		return redirect('/sp/manageservice')
	else:
		return usercheck_profiling(request,'deleteservice.html',True)

def manageappointment(request):
	
	uid = request.COOKIES['userid']
	
	if uid == None or uid == '':
		return redirect('/homepage')
	import datetime
	objs = appointment.objects.filter(clientid=uid).select_related('serviceid')
	isexists = False
	if len(objs)>0:
		isexists = True
	arr = []
	# for x in objs:
	# 	if x > datetime.now():

	if request.method == 'GET':
		return usercheck_profiling(request,'manageappointment.html',True,{'appointment':appointment.objects.filter(clientid=uid),"isappointmentsare":isexists})
	else:
		return usercheck_profiling(request,'manageappointment.html',True,{'appointment':appointment.objects.filter(clientid=uid)})

def manageappointment_sp(request):
	
	spid = request.COOKIES['spid']
	
	if spid == None or spid == '':
		return redirect('/homepage')
	
	objs = appointment.objects.filter(serviceid__in=service.objects.filter(providerid=spid)).select_related('serviceid')
	isexists = False
	if len(objs)>0:
		isexists = True
	arr = []
	# for x in objs:
	# 	if x > datetime.now():

	if request.method == 'GET':
		return usercheck_profiling(request,'manageappointment_sp.html',True,{'appointment':appointment.objects.filter(serviceid__in=service.objects.filter(providerid=spid)),"isappointmentsare":isexists})
	else:
		return usercheck_profiling(request,'manageappointment_sp.html',True,{'appointment':appointment.objects.filter(serviceid__in=service.objects.filter(providerid=spid))})

def view_service(request):
	
	sid = request.GET['serid']
	obj = service.objects.filter(id=sid)

	return usercheck_profiling(request,'view_service.html',False,{"ser":obj[0],"provider":obj[0].providerid.name})

def exploreservice(request):
	pass

def searchservice(request):
	pass

def editappointment(request,appid):
	uid = request.COOKIES['userid']
	if uid == None or uid == '' or uid == ' ':
		return redirect('/')
	if request.method == 'GET':
		
		obj = appointment.objects.filter( id = appid ).select_related( 'serviceid' )
		return usercheck_profiling(request,'editappointment.html',False,{'app':obj[0]})
	else:
	# str1 = dt.strptime(str(obj[0].time),'%H:%M:%S')
	# print('\n\n',obj[0].time.strftime("%H:%M"),'\n\n')
		dt = request.POST
		appointment.objects.filter(id=dt['appid'],serviceid=dt['serid']).update(time=dt['time'],date=dt['date'],description=dt['detail'])
		return redirect('/')

	

def deleteappointment(request,appid):
	uid = request.COOKIES['userid']
	if uid == None or uid == '' or uid == ' ':
		return redirect('/')
	if request.method == 'GET':
		
		appointment.objects.filter( id = appid ).delete()
		return redirect('/client/dashboard')
	else:
	# str1 = dt.strptime(str(obj[0].time),'%H:%M:%S')
	# print('\n\n',obj[0].time.strftime("%H:%M"),'\n\n')
		
		return None

def appapprove(request):
	from django.core.mail import send_mail,SafeMIMEText
	from django.conf import settings

	obj = appointment.objects.filter(id=request.POST['appid'])
	obj.update(status="Approved")
	print(obj[0].clientid.email)

	x = """---------------------------------------------------"""
	x += """\n Your appointment is approved for\n Service Name :- {}\n Service Type :- {}\n time :- {}\n Date :- {}\n Location :- {}\n""".format(obj[0].serviceid.title,obj[0].serviceid.stype,obj[0].time,obj[0].date,obj[0].serviceid.location)
	x += """--------------------------------------------------"""
	send_mail('Approved - AppointmentMaster',x,settings.EMAIL_HOST_USER,[obj[0].clientid.email],fail_silently=False)
	return redirect('/sp/appointment')

def appreject(request):
	appointment.objects.filter(id=request.POST['appid']).update(status="Rejected")
	return redirect('/sp/appointment')

def search(request):
	items = service.objects.filter(Q(title__icontains=request.GET['searchtext'])|Q(description__icontains=request.GET['searchtext'])|Q(stype__icontains=request.GET['searchtext']))
	isitems = False
	if len(items)>0:
		isitems = True
	return usercheck_profiling(request,'search.html',False,{'search':items,'issearch':isitems})

@csrf_exempt
def order(request):

	
	param_dict = {

        'MID': "TsmOJd40100529105511",
        'ORDER_ID': '001',
        'TXN_AMOUNT': '100',
        'CUST_ID': "pareshsharma98000@gmail.com",
        'INDUSTRY_TYPE_ID': 'Retail',
        'WEBSITE': 'WEBSTAGING',
        'CHANNEL_ID': 'WEB',
        'CALLBACK_URL':'http://localhost:8000/handlerequest/',
    }
	param_dict['CHECKSUMHASH'] = checksum.generate_checksum(param_dict, MERCHANT_KEY)

	return render(request, 'paytm.html', {'param_dict': param_dict})

@csrf_exempt
def handlerequest(request):
	# paytm will send you post request here
    form = request.POST
    response_dict = {}
    checksum1 = ""
    for i in form.keys():
        response_dict[i] = form[i]
        if i == 'CHECKSUMHASH':
            checksum1 = form[i]

    verify = checksum.verify_checksum(response_dict, MERCHANT_KEY, checksum1)

    if verify:
        if response_dict['RESPCODE'] == '01':
            print('order successful')
        else:
            print('order was not successful because' + response_dict['RESPMSG'])
    return render(request, '/paymentstatus.html', {'response': response_dict})	

def paytm(request):
	return render(request,"paytm.html",{})
