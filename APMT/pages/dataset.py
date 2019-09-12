
class client:
	id = None
	name = None
	phone_no = None
	gender = None
	city = None
	email = None
	password = None

	def get(req):
		d = req.POST
		client.name = d['name']
		client.password = d['password']
		client.phone_no = d['phone_no']
		client.email = d['email']
		client.address = d['address']
		

class admin:
	id = None
	password = None
	username = None

class SP:
	id = None
	name = None
	phone_no = None
	address = None
	city = None
	email = None
	mobile = None
	password = None

class appointment:
	id = None
	userid = None
	serviceid = None
	status = None
	time = None
	data = None
	location = None

class service:
	id = None
	title = None
	providerid = None
	detail = None
	city = None
	time = None
	day = None
	image = None

class tag:
	id = None
	tage = None
	serviceid = None