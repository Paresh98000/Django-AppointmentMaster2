from django.db import models

class client(models.Model):
	id = models.IntegerField(primary_key=True)
	name = models.CharField(max_length=30)
	city = models.CharField(max_length=30)
	email = models.CharField(max_length=30)	
	phone_no = models.CharField(max_length=30)
	password = models.CharField(max_length=30)
	gender = models.CharField(max_length=4)
	
	def save(self):
		import MySQLdb as s

		con = s.connect(user = 'root',password='',database='appointmentmaster')
		cur = con.cursor()
		query = 'insert into pages_client (id,name,city,email,phone_no,password,gender) values ({},"{}","{}","{}","{}","{}","{}")'.format(self.id,self.name,self.city,self.email,self.phone_no,self.password,self.gender)
		print("\n\n",self.name,"\n\n")
		out = cur.execute(query)
		if out > 0:
			con.commit()
		return out

class admin(models.Model):
	id = models.IntegerField(primary_key=True)
	username = models.CharField(max_length=30)
	password = models.CharField(max_length=30)

class sp(models.Model):
	id = models.IntegerField(primary_key=True)
	name = models.CharField(max_length=30)
	email = models.CharField(max_length=30)	
	city = models.CharField(max_length=30)
	phone_no = models.CharField(max_length=30)
	password = models.CharField(max_length=30)
	status = models.CharField(max_length=10)

	def save(self):

		import MySQLdb as s

		con = s.connect(user = 'root',password='',database='appointmentmaster')
		cur = con.cursor()
		query = 'insert into pages_sp (id,name,city,email,phone_no,password) values ({},"{}","{}","{}","{}","{}")'.format(self.id,self.name,self.city,self.email,self.phone_no,self.password)
		
		print("\n\n",self.name,"\n\n")
		
		out = cur.execute(query)
		
		if out > 0:
			con.commit()
		
		return out

class service(models.Model):
	id = models.IntegerField(primary_key=True)
	providerid = models.ForeignKey(sp,on_delete=models.CASCADE)
	title = models.CharField(max_length=30)
	
	time_start_h = models.CharField(max_length=2)
	time_start_m = models.CharField(max_length=2)
	
	time_end_h = models.CharField(max_length=2)
	time_end_m = models.CharField(max_length=2)

	city = models.CharField(max_length=30)
	location = models.CharField(max_length=30)
	day = models.CharField(max_length=30)
	description = models.CharField(max_length=300)
	
	image = models.CharField(max_length=30)

	status = models.CharField(max_length=10)
	stype = models.CharField(max_length=10)

	phone_no = models.CharField(max_length=10,default='')

	cost = models.FloatField(default=0)

class appointment(models.Model):
	id = models.IntegerField(primary_key=True)
	clientid = models.ForeignKey(client,on_delete=models.CASCADE)
	serviceid = models.ForeignKey(service,on_delete=models.CASCADE)
	description = models.CharField(max_length=288)
	date = models.DateField()
	time = models.TimeField()
	status = models.CharField(default="Pending",max_length=10)