from django.db import models

# Create your models here.
class Tbl_User(models.Model):
	name=models.CharField(max_length=30,default='')
	phone=models.CharField(max_length=50,default='')
	address=models.CharField(max_length=30,default='')
	email=models.CharField(max_length=30,default='')
	pswd=models.CharField(max_length=30,default='')
	status=models.CharField(max_length=30,default='')
	user_type=models.CharField(max_length=30,default='')
	idproof=models.ImageField(upload_to='pic/',default='')

class Tbl_Product(models.Model):
	user_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	img=models.ImageField(upload_to='pic/',default='')
	name=models.CharField(max_length=30,default='')
	car_number=models.CharField(max_length=50,default='')
	seat=models.CharField(max_length=30,default='')
	specification=models.CharField(max_length=30,default='')
	price=models.CharField(max_length=30,default='')
	status=models.CharField(max_length=30,default='')

class Tbl_feedback(models.Model):
	user_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	feedback=models.CharField(max_length=30,default='')

class Tbl_booking(models.Model):
	buyer_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	# owner_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	product_id=models.ForeignKey(Tbl_Product,on_delete=models.CASCADE, blank=True,null=True)
	date=models.CharField(max_length=30,default='')
	fromdate=models.CharField(max_length=30,default='')
	todate=models.CharField(max_length=30,default='')
	hrs=models.CharField(max_length=30,default='')
	status=models.CharField(max_length=30,default='')
	owner_email=models.CharField(max_length=30,default='')

class Tbl_driverBook(models.Model):
	buyer_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	driver_email=models.CharField(max_length=30,default='')
	driver_phone=models.CharField(max_length=30,default='')
	date=models.CharField(max_length=30,default='')
	fromdate=models.CharField(max_length=30,default='')
	todate=models.CharField(max_length=30,default='')
	hrs=models.CharField(max_length=30,default='')
	status=models.CharField(max_length=30,default='')

class Tbl_complaint(models.Model):
	buyer_id=models.ForeignKey(Tbl_User,on_delete=models.CASCADE, blank=True,null=True)
	police_email=models.CharField(max_length=30,default='')
	subject=models.CharField(max_length=30,default='')
	description=models.CharField(max_length=30,default='')
	location=models.CharField(max_length=30,default='')
	date=models.CharField(max_length=30,default='')
	status=models.CharField(max_length=30,default='')
	reply=models.CharField(max_length=30,default='')



	
	
