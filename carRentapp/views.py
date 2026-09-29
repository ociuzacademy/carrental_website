from django.shortcuts import render
from django.conf import settings
from django.conf.urls.static import static
from django.core.mail import send_mail
from django.template.loader import render_to_string
from django.http import HttpResponse, HttpResponseRedirect
from .models import*
import datetime

# Create your views here.

def index(request):
	return render(request,'index.html')
def about(request):
	return render(request,'about.html')
def contact(request):
	return render(request,'contact.html')
def owner_register(request):
	if request.method=="POST":
		name=request.POST['name']
		phone=request.POST['phone']
		address=request.POST['address']
		email=request.POST['email']
		pswd=request.POST['pswd']
		img=request.FILES['img']
		aa=Tbl_User(idproof=img,name=name,phone=phone,address=address,email=email,pswd=pswd,status='pending',user_type='owner')
		aa.save()
		txt="""<script>alert('success...');window.location='/owner_register/';</script>"""
		return HttpResponse(txt)
	else:
		return render(request,'register.html')
def buyer_reg(request):
	if request.method=="POST":
		name=request.POST['name']
		phone=request.POST['phone']
		address=request.POST['address']
		email=request.POST['email']
		pswd=request.POST['pswd']
		img=request.FILES['img']
		aa=Tbl_User(idproof=img,name=name,phone=phone,address=address,email=email,pswd=pswd,status='pending',user_type='buyer')
		aa.save()
		txt="""<script>alert('success...');window.location='/buyer_reg/';</script>"""
		return HttpResponse(txt)
	else:
		return render(request,'buyer_reg.html')
def driver_reg(request):
	if request.method=="POST":
		name=request.POST['name']
		phone=request.POST['phone']
		address=request.POST['address']
		email=request.POST['email']
		pswd=request.POST['pswd']
		img=request.FILES['img']
		aa=Tbl_User(idproof=img,name=name,phone=phone,address=address,email=email,pswd=pswd,status='pending',user_type='driver')
		aa.save()
		txt="""<script>alert('success...');window.location='/driver_reg/';</script>"""
		return HttpResponse(txt)
	else:
		return render(request,'driver_reg.html')
def login(request):
	if request.method=="POST":
		email=request.POST["email"]
		password=request.POST["pswd"]
		chk=Tbl_User.objects.filter(email=email, pswd=password,user_type="admin")
		chk1=Tbl_User.objects.filter(email=email, pswd=password,user_type="owner",status='approved')
		chk2=Tbl_User.objects.filter(email=email, pswd=password,user_type="buyer")
		chk3=Tbl_User.objects.filter(email=email, pswd=password,user_type="police")
		chk4=Tbl_User.objects.filter(email=email, pswd=password,user_type="driver",status='approved')

		if chk:
			for x in chk:
				request.session['id'] = x.id
			return render(request,'Admin/admin_home.html')
		elif chk1:
			for x in chk1:
				request.session['id'] = x.id
			return render(request,'Owner/owner_home.html')
		elif chk2:
			for x in chk2:
				request.session['id'] = x.id
			return render(request,'Buyer/buyer_home.html')
		elif chk3:
			for x in chk3:
				request.session['id'] = x.id
			return render(request,'Police/police_home.html')
		elif chk4:
			for x in chk4:
				request.session['id'] = x.id
			return render(request,'Driver/driver_home.html')
		else:
			return render(request,'login.html',{'msg': 'Invalid login credentials.!'})
	else:
		return render(request,'login.html')
def logout(request):
    if request.session.has_key('id'):
        del request.session['id']
        logout(request)
    return HttpResponseRedirect('/')
#-----------------------Admin-------------------------------
def admin_home(request):
	return render(request,'Admin/admin_home.html')
def admin_ownerlist(request):
	var=Tbl_User.objects.all().filter(user_type='owner',status='pending')
	var1=Tbl_User.objects.all().filter(user_type='owner',status='approved')
	var2=Tbl_User.objects.all().filter(user_type='owner',status='rejected')
	return render(request,'Admin/admin_ownerlist.html',{'var':var,'var1':var1,'var2':var2})
def admin_buyerlist(request):
	var=Tbl_User.objects.all().filter(user_type='buyer',status='pending')
	return render(request,'Admin/admin_buyerlist.html',{'var':var})
def admin_driverlist(request):
	var=Tbl_User.objects.all().filter(user_type='driver',status='pending')
	var1=Tbl_User.objects.all().filter(user_type='driver',status='approved')
	var2=Tbl_User.objects.all().filter(user_type='driver',status='rejected')
	return render(request,'Admin/admin_driverlist.html',{'var':var,'var1':var1,'var2':var2})
def admin_owner_approve(request):
	ii=request.GET['id']
	var=Tbl_User.objects.all().filter(id=ii).update(status='approved')
	return HttpResponseRedirect('/admin_ownerlist/')
def admin_owner_reject(request):
	ii=request.GET['id']
	var=Tbl_User.objects.all().filter(id=ii).update(status='rejected')
	return HttpResponseRedirect('/admin_ownerlist/')
def admin_driver_approve(request):
	ii=request.GET['id']
	var=Tbl_User.objects.all().filter(id=ii).update(status='approved')
	return HttpResponseRedirect('/admin_driverlist/')
def admin_driver_reject(request):
	ii=request.GET['id']
	var=Tbl_User.objects.all().filter(id=ii).update(status='rejected')
	return HttpResponseRedirect('/admin_driverlist/')
def admin_add_police(request):
	if request.method=="POST":
		name=request.POST['name']
		phone=request.POST['phone']
		address=request.POST['address']
		email=request.POST['email']
		pswd=request.POST['pswd']
		img=request.FILES['img']
		aa=Tbl_User(idproof=img,name=name,phone=phone,address=address,email=email,pswd=pswd,status='pending',user_type='police')
		aa.save()
		txt="""<script>alert('success...');window.location='/admin_add_police/';</script>"""
		return HttpResponse(txt)
	else:
		return render(request,'Admin/admin_add_police.html')
def admin_policelist(request):
	var=Tbl_User.objects.all().filter(user_type='police')
	return render(request,'Admin/admin_view_police.html',{'var':var})
def admin_delete_police(request):
	ii=request.GET['id']
	var=Tbl_User.objects.all().filter(id=ii)
	var.delete()
	return render(request,'Admin/admin_view_police.html')
def admin_feedback(request):
	var=Tbl_feedback.objects.all()
	return render(request,'Admin/admin_feedback.html',{'var':var})
def admin_delete_feedback(request):
	ii=request.GET['id']
	var=Tbl_feedback.objects.all().filter(id=ii)
	var.delete()
	return HttpResponseRedirect('/admin_feedback/')
def admin_view_products(request):
	var=Tbl_Product.objects.all()
	return render(request,'Admin/admin_view_products.html',{'var':var})
#-----------------------Owner-------------------------------
def owner_home(request):
	return render(request,'Owner/owner_home.html')
def owner_profile(request):
	myid=request.session['id']
	var=Tbl_User.objects.all().filter(id=myid)
	return render(request,'Owner/owner_profile.html',{'var':var})
def owner_edit_profile(request):
	myid=request.session['id']
	var=Tbl_User.objects.all().filter(id=myid)
	if request.method=="POST":
		phone=request.POST['phone']
		address=request.POST['address']
		email=request.POST['email']
		pswd=request.POST['pswd']
		aa=Tbl_User.objects.all().filter(id=myid).update(phone=phone,address=address,email=email,pswd=pswd)
		txt="""<script>alert('success...');window.location='/owner_profile/';</script>"""
		return HttpResponse(txt)
	else:
		return render(request,'Owner/owner_edit_profile.html',{'var':var})
def owner_add_product(request):
	myid=request.session['id']
	if request.method=="POST":
		img=request.FILES['img']
		name=request.POST['name']
		number=request.POST['number']
		seat=request.POST['seat']
		specification=request.POST['specification']
		price=request.POST['price']
		uid=Tbl_User.objects.get(id=myid)
		aa=Tbl_Product(img=img,name=name,car_number=number,seat=seat,specification=specification,price=price,user_id=uid,status='pending')
		aa.save()
		txt="""<script>alert('success...');window.location='/owner_add_product/';</script>"""
		return HttpResponse(txt)
	else:
		return render(request,'Owner/owner_add_product.html')
def owner_view_product(request):
	myid=request.session['id']
	var=Tbl_Product.objects.all().filter(user_id=myid)
	return render(request,'Owner/owner_view_product.html',{'var':var})
def owner_edit_product(request):
	myid=request.session['id']
	if request.method=="POST":
		specification=request.POST['specification']
		price=request.POST['price']
		pid=request.POST['ii']
		aa=Tbl_Product.objects.all().filter(id=pid).update(specification=specification,price=price)
		txt="""<script>alert('success...');window.location='/owner_view_product/';</script>"""
		return HttpResponse(txt)
	else:
		ii=request.GET['id']
		var=Tbl_Product.objects.all().filter(id=ii)
		return render(request,'Owner/owner_edit_product.html',{'var':var,'ii':ii})
def owner_delete_product(request):
	ii=request.GET['id']
	var=Tbl_Product.objects.all().filter(id=ii)
	var.delete()
	return render(request,'Owner/owner_view_product.html')
def owner_feedback(request):
	myid=request.session['id']
	var=Tbl_User.objects.all().filter(id=myid)
	if request.method=="POST":
		feedback=request.POST['feedback']
		uid=Tbl_User.objects.get(id=myid)
		aa=Tbl_feedback(feedback=feedback,user_id=uid)
		aa.save()
		txt="""<script>alert('success...');window.location='/owner_feedback/';</script>"""
		return HttpResponse(txt)
	else:
		return render(request,'Owner/owner_feedback.html',{'var':var})
def owner_view_request(request):
	myid=request.session['id']
	own=Tbl_User.objects.all().filter(id=myid)
	for x in own:
		owner_email=x.email
	var=Tbl_booking.objects.all().filter(owner_email=owner_email,status='pending')
	var1=Tbl_booking.objects.all().filter(owner_email=owner_email,status='approved')
	var2=Tbl_booking.objects.all().filter(owner_email=owner_email,status='rejected')
	return render(request,'Owner/owner_view_request.html',{'var':var,'var1':var1,'var2':var2})
def owner_approve_request(request):
	ii=request.GET['id']
	var=Tbl_booking.objects.all().filter(id=ii).update(status='approved')
	return HttpResponseRedirect('/owner_view_request/')
def owner_reject_request(request):
	ii=request.GET['id']
	var=Tbl_booking.objects.all().filter(id=ii).update(status='rejected')
	return HttpResponseRedirect('/owner_view_request/')


import datetime
import logging

from django.http import JsonResponse
from django.views.decorators.http import require_POST

from .services.price_prediction import predict_rental_price

logger = logging.getLogger(__name__)


@require_POST
def owner_predict_price(request):
    try:
        # 1. Read form data
        brand = request.POST.get("brand", "").strip()
        model_name = request.POST.get("model_name", "").strip()
        manufacturing_year = int(
            request.POST.get("manufacturing_year", "")
        )
        vehicle_type = request.POST.get("vehicle_type", "").strip()
        fuel_type = request.POST.get("fuel_type", "").strip()
        transmission = request.POST.get("transmission", "").strip()

        # HTML field name is "seat"
        seats = int(request.POST.get("seat", ""))

        mileage = float(request.POST.get("mileage", ""))
        condition = request.POST.get("condition", "").strip()
        location = request.POST.get("location", "").strip()
        rental_duration = int(
            request.POST.get("rental_duration", "")
        )

        # 2. Validate required text fields
        required_fields = {
            "brand": brand,
            "model_name": model_name,
            "vehicle_type": vehicle_type,
            "fuel_type": fuel_type,
            "transmission": transmission,
            "condition": condition,
            "location": location,
        }

        missing_fields = [
            name for name, value in required_fields.items()
            if not value
        ]

        if missing_fields:
            return JsonResponse({
                "success": False,
                "error": "Missing required fields: "
                         + ", ".join(missing_fields)
            }, status=400)

        # 3. Validate numerical fields
        current_year = datetime.date.today().year
        month = datetime.date.today().month

        if not 1990 <= manufacturing_year <= current_year:
            return JsonResponse({
                "success": False,
                "error": "Invalid manufacturing year."
            }, status=400)

        if not 1 <= seats <= 20:
            return JsonResponse({
                "success": False,
                "error": "Seats must be between 1 and 20."
            }, status=400)

        if not 0 < mileage <= 200:
            return JsonResponse({
                "success": False,
                "error": "Mileage must be greater than 0 and at most 200."
            }, status=400)

        if not 1 <= rental_duration <= 365:
            return JsonResponse({
                "success": False,
                "error": "Rental duration must be between 1 and 365 days."
            }, status=400)

        # 4. Temporary demand and availability values
        # Replace these with actual database calculations.
        demand_score = 50
        available_vehicles = 5

        # 5. Generate AI/ML price prediction
        try:
            price = predict_rental_price(
                brand=brand,
                model_name=model_name,
                manufacturing_year=manufacturing_year,
                vehicle_type=vehicle_type,
                fuel_type=fuel_type,
                transmission=transmission,
                seats=seats,
                mileage=mileage,
                condition=condition,
                location=location,
                rental_duration=rental_duration,
                month=month,
                demand_score=demand_score,
                available_vehicles=available_vehicles,
            )
        except Exception:
            logger.exception(
                "ML prediction failed for brand=%s, model=%s",
                brand, model_name
            )
            return JsonResponse({
                "success": False,
                "error": "The ML model failed to predict the rental price. "
                         "Check the Django terminal for details."
            }, status=500)

        # 6. Validate model output
        if not isinstance(price, (int, float)) or not (
            0 < price < float("inf")
        ):
            logger.error("Invalid ML prediction returned: %r", price)
            return JsonResponse({
                "success": False,
                "error": "The model returned an invalid rental price."
            }, status=500)

        # 7. Return successful response
        return JsonResponse({
            "success": True,
            "predicted_price": round(float(price), 2),
            "currency": "INR",
            "period": "per day",
            "message": "Rental price predicted successfully."
        })

    except (ValueError, TypeError, KeyError) as exc:
        logger.warning(
            "Invalid price prediction input: %s",
            exc,
            exc_info=True
        )
        return JsonResponse({
            "success": False,
            "error": "Invalid input: " + str(exc)
        }, status=400)

    except Exception:
        logger.exception("Unexpected rental price prediction error")
        return JsonResponse({
            "success": False,
            "error": "Price prediction is temporarily unavailable."
        }, status=500)
	
#-----------------------Buyer-------------------------------
def buyer_home(request):
	return render(request,'Buyer/buyer_home.html')
def buyer_profile(request):
	myid=request.session['id']
	var=Tbl_User.objects.all().filter(id=myid)
	return render(request,'Buyer/buyer_profile.html',{'var':var})
def buyer_edit_prof(request):
	myid=request.session['id']
	var=Tbl_User.objects.all().filter(id=myid)
	if request.method=="POST":
		phone=request.POST['phone']
		address=request.POST['address']
		email=request.POST['email']
		pswd=request.POST['pswd']
		aa=Tbl_User.objects.all().filter(id=myid).update(phone=phone,address=address,email=email,pswd=pswd)
		txt="""<script>alert('success...');window.location='/buyer_profile/';</script>"""
		return HttpResponse(txt)
	else:
		return render(request,'Buyer/buyer_edit_prof.html',{'var':var})
def buyer_view_product(request):
	var=Tbl_Product.objects.all().filter(status='pending')
	return render(request,'Buyer/buyer_view_product.html',{'var':var})
def buyer_feedback(request):
	myid=request.session['id']
	var=Tbl_User.objects.all().filter(id=myid)
	if request.method=="POST":
		feedback=request.POST['feedback']
		uid=Tbl_User.objects.get(id=myid)
		aa=Tbl_feedback(feedback=feedback,user_id=uid)
		aa.save()
		txt="""<script>alert('success...');window.location='/buyer_feedback/';</script>"""
		return HttpResponse(txt)
	else:
		return render(request,'Buyer/buyer_feedback.html',{'var':var})
def buyer_request_product(request):
	myid=request.session['id']
	if request.method=="POST":
		idd=request.POST['ii']
		owner=Tbl_Product.objects.all().filter(id=idd)
		for x in owner:
			owner_email=x.user_id.email
		uid=Tbl_User.objects.get(id=myid)
		pid=Tbl_Product.objects.get(id=idd)
		date=datetime.datetime.today()
		fromdate=request.POST['fromdate']
		todate=request.POST['todate']
		hrs=request.POST['hrs']
		var=Tbl_Product.objects.all().filter(id=idd).update(status='requested')
		aa=Tbl_booking(owner_email=owner_email,buyer_id=uid,product_id=pid,date=date,fromdate=fromdate,todate=todate,hrs=hrs,status='pending')
		aa.save()
		return HttpResponseRedirect('/buyer_view_product/')
	else:
		ii=request.GET['id']
		return render(request,'Buyer/buyer_request_form.html',{'ii':ii})
def buyer_request_status(request):
	myid=request.session['id']
	var=Tbl_booking.objects.all().filter(buyer_id=myid)
	return render(request,'Buyer/buyer_request_status.html',{'var':var})
def buyer_view_driver(request):
	var=Tbl_User.objects.all().filter(user_type='driver')
	return render(request,'Buyer/buyer_view_driver.html',{'var':var})
def buyer_view_police(request):
	var=Tbl_User.objects.all().filter(user_type='police')
	return render(request,'Buyer/buyer_view_police.html',{'var':var})
def buyer_driver_request(request):
	myid=request.session['id']
	if request.method=="POST":
		idd=request.POST['ii']
		driver=Tbl_User.objects.all().filter(id=idd)
		for x in driver:
			driver_email=x.email
			driver_phone=x.phone
		uid=Tbl_User.objects.get(id=myid)
		date=datetime.datetime.today()
		fromdate=request.POST['fromdate']
		todate=request.POST['todate']
		hrs=request.POST['hrs']
		aa=Tbl_driverBook(driver_phone=driver_phone,driver_email=driver_email,buyer_id=uid,date=date,fromdate=fromdate,todate=todate,hrs=hrs,status='pending')
		aa.save()

		subject = 'Car Rent System Team'
		message = f'Hi , You have a request form customer Please login your account..'
		email_from = settings.EMAIL_HOST_USER 
		recipient_list = [driver_email, ] 
		print("mail sent")
		send_mail( subject, message, email_from, recipient_list )
		# return HttpResponseRedirect('/doctor_view_patient/')

		return HttpResponseRedirect('/buyer_view_driver/')
	else:
		ii=request.GET['id']
		return render(request,'Buyer/buyer_driver_request.html',{'ii':ii})
def buyer_driver_req_status(request):
	myid=request.session['id']
	var=Tbl_driverBook.objects.all().filter(buyer_id=myid)
	return render(request,'Buyer/buyer_driver_req_status.html',{'var':var})
def buyer_complaints(request):
	myid=request.session['id']
	police=Tbl_User.objects.all().filter(user_type='police')
	if request.method=="POST":
		subject=request.POST['subject']
		description=request.POST['description']
		location=request.POST['location']
		police_email=request.POST['police']
		date=datetime.datetime.today()
		uid=Tbl_User.objects.get(id=myid)
		aa=Tbl_complaint(police_email=police_email,buyer_id=uid,subject=subject,description=description,location=location,date=date,status='pending')
		aa.save()
		return HttpResponseRedirect('/buyer_complaint_status/')
	else:
		return render(request,'Buyer/buyer_complaints.html',{'police':police})
def buyer_complaint_status(request):
	myid=request.session['id']
	var=Tbl_complaint.objects.all().filter(buyer_id=myid)
	return render(request,'Buyer/buyer_complaint_status.html',{'var':var})

#-----------------------Driver-------------------------------
def driver_home(request):
	return render(request,'Driver/driver_home.html')
def driver_profile(request):
	myid=request.session['id']
	var=Tbl_User.objects.all().filter(id=myid)
	return render(request,'Driver/driver_profile.html',{'var':var})
def driver_edit_prof(request):
	myid=request.session['id']
	var=Tbl_User.objects.all().filter(id=myid)
	if request.method=="POST":
		phone=request.POST['phone']
		address=request.POST['address']
		email=request.POST['email']
		pswd=request.POST['pswd']
		aa=Tbl_User.objects.all().filter(id=myid).update(phone=phone,address=address,email=email,pswd=pswd)
		txt="""<script>alert('success...');window.location='/driver_profile/';</script>"""
		return HttpResponse(txt)
	else:
		return render(request,'Driver/driver_edit_prof.html',{'var':var})
def driver_view_req(request):
	myid=request.session['id']
	drive=Tbl_User.objects.all().filter(id=myid)
	for x in drive:
		driver_email=x.email
	var=Tbl_driverBook.objects.all().filter(driver_email=driver_email,status='pending')
	var1=Tbl_driverBook.objects.all().filter(driver_email=driver_email,status='approved')
	var2=Tbl_driverBook.objects.all().filter(driver_email=driver_email,status='rejected')
	return render(request,'Driver/driver_view_req.html',{'var':var,'var1':var1,'var2':var2})
def driver_approve_request(request):
	ii=request.GET['id']
	var=Tbl_driverBook.objects.all().filter(id=ii).update(status='approved')
	return HttpResponseRedirect('/driver_view_req/')
def driver_reject_request(request):
	ii=request.GET['id']
	var=Tbl_driverBook.objects.all().filter(id=ii).update(status='rejected')
	return HttpResponseRedirect('/driver_view_req/')

#-----------------------Police-------------------------------
def police_home(request):
	return render(request,'Police/police_home.html')
def police_profile(request):
	myid=request.session['id']
	var=Tbl_User.objects.all().filter(id=myid)
	return render(request,'Police/police_profile.html',{'var':var})
def police_edit_prof(request):
	myid=request.session['id']
	var=Tbl_User.objects.all().filter(id=myid)
	if request.method=="POST":
		phone=request.POST['phone']
		address=request.POST['address']
		email=request.POST['email']
		pswd=request.POST['pswd']
		aa=Tbl_User.objects.all().filter(id=myid).update(phone=phone,address=address,email=email,pswd=pswd)
		txt="""<script>alert('success...');window.location='/police_profile/';</script>"""
		return HttpResponse(txt)
	else:
		return render(request,'Police/police_edit_profile.html',{'var':var})
def police_view_complaint(request):
	myid=request.session['id']
	police=Tbl_User.objects.all().filter(id=myid)
	for x in police:
		police_email=x.email
	var=Tbl_complaint.objects.all().filter(police_email=police_email,status='pending')
	var1=Tbl_complaint.objects.all().filter(police_email=police_email,status='replied')
	return render(request,'Police/police_view_complaint.html',{'var':var,'var1':var1})
def police_reply(request):
	myid=request.session['id']
	
	if request.method=="POST":
		reply=request.POST['reply']
		idd=request.POST['ii']
		aa=Tbl_complaint.objects.all().filter(id=idd).update(reply=reply,status='replied')
		return HttpResponseRedirect('/police_view_complaint/')
	else:
		ii=request.GET['id']
		sub=Tbl_complaint.objects.all().filter(id=ii)
		return render(request,'Police/police_reply.html',{'sub':sub,'ii':ii})
def police_remove_complaint(request):
	ii=request.GET['id']
	var=Tbl_complaint.objects.all().filter(id=ii)
	var.delete()
	return HttpResponseRedirect('/police_view_complaint/')


