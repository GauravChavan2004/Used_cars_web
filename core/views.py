from django.shortcuts import render, redirect, get_object_or_404
from core.models import Car
from django.core.mail import send_mail
from django.contrib.auth.decorators import login_required
from django.contrib import messages
from datetime import datetime, timedelta
from .models import Car, TestDriveBooking
from django.urls import reverse
from django.http import JsonResponse
from django.template.loader import render_to_string
from .models import CarSubmission
from django.contrib.admin.views.decorators import staff_member_required
from django.db.models import Case, When, Value, IntegerField
from django.db.models.functions import Upper
from django.template.loader import render_to_string


# Create your views here.
def index(request):
    data = Car.objects.all()
    formatted_data = []
    for car in data:
        lakh_price = car.price / 100000  # Convert the price to lakh
        formatted_price = "{:.2f} lakh".format(lakh_price)  # Format the price
        
        formatted_data.append({
            'car': car,
            'formatted_price': formatted_price
        })
    return render(request,"core/index.html",{'formatted_data': formatted_data})

def home_page(request):
    data = Car.objects.all()
    formatted_data = []
    #Filter Backend
    makes = Car.MAKE_CHOICES
    selected_makes = request.GET.getlist('make')  # Get selected makes from the form
    selected_fuel = request.GET.get('fuelType')
    selected_year = request.GET.get('yearType')
    try:
        max_price = int(request.GET.get('max_price', 2000000))  # Convert string to int
    except ValueError:
        max_price = 2000000  # Default in case of error    
    cars = Car.objects.all()

    if selected_makes:
        cars = cars.filter(make__in=selected_makes)

    if selected_fuel:
        cars = cars.filter(fuel_type=selected_fuel)

    if selected_year:
        cars = cars.filter(manufacture_year__gte=int(selected_year))

    if max_price:
        cars = cars.filter(price__lte=max_price)
    

    cars = cars.annotate(
    status_upper=Upper('status')
    ).annotate(
        status_order=Case(
            When(status_upper="AVAILABLE", then=Value(1)),
            When(status_upper="BOOKED", then=Value(2)),
            When(status_upper="SOLD", then=Value(3)),
            default=Value(4),
            output_field=IntegerField(),
        )
    ).order_by('status_order')

    for car in cars:
        lakh_price = car.price / 100000  # Convert the price to lakh
        formatted_price = "{:.2f} lakh".format(lakh_price)  # Format the price
        
        formatted_data.append({
            'car': car,
            'formatted_price': formatted_price
        })
        print(f"{car.id}: {car.status} - Order: {car.status_order}")
    
    # Pass only the formatted data to the template
    return render(request, "core/home_page.html", {'formatted_data': formatted_data,'makes': makes,'selected_makes': selected_makes,
        'selected_fuel': selected_fuel,
        'selected_year': selected_year,})

def indian_format(value):
    """
    Format numbers with commas according to the Indian numbering system.
    E.g., 500000 becomes 5,00,000
    """
    try:
        value = int(value)  # Ensure the value is an integer
        value_str = str(value)  # Convert the number to a string

        if len(value_str) > 3:
            # Split the string into the part before the last 3 digits (thousands)
            first_part = value_str[:-3]  # All digits except the last 3
            last_part = value_str[-3:]   # The last 3 digits (thousands)

            # Add commas after every 2 digits, starting from the right
            # The first part will have commas inserted after every two digits
            first_part = first_part[::-1]  # Reverse the first part to make it easier to group
            first_part = ','.join([first_part[i:i + 2] for i in range(0, len(first_part), 2)])
            first_part = first_part[::-1]  # Reverse it back to the correct order

            # Combine the first part and the last part with a comma
            formatted_value = first_part + ',' + last_part
        else:
            formatted_value = value_str  # If the number has 3 digits or fewer, no need to format

        return formatted_value
    except (ValueError, TypeError):
        return value  # If there's an error, return the value as it is
    

def car_view(request, car_id):
    car = get_object_or_404(Car, id=car_id)  # Fetch car by ID
    car.formatted_price = indian_format(car.price)  # Format only the selected car

    return render(request, "car_view/car_view.html", {'car': car})

@login_required
def test_drive(request, car_id):
    car1 = get_object_or_404(Car, id=car_id)
    car1.formatted_price = indian_format(car1.price)

    date_list = []
    for i in range(4):
        future_date = datetime.today() + timedelta(days=i)
        date_list.append({
            "date": future_date.strftime("%Y-%m-%d"),
            "weekday": future_date.strftime("%a"),
            "day": future_date.strftime("%d"),
            "month": future_date.strftime("%b")
        })

    time_slots = ["10 AM - 11 AM", "11 AM - 12 PM", "12 PM - 1 PM",
                  "2 PM - 3 PM", "3 PM - 4 PM", "4 PM - 5 PM"]

    if request.method == "POST":
        selected_date = request.POST.get("selected_date")
        selected_time = request.POST.get("selected_time")

        if not selected_date or not selected_time:
            messages.error(request, "Please select both date and time.")
            return redirect("core_url:test_drive", car_id=car1.id)

        try:
            # Convert string to date object
            selected_date_obj = datetime.strptime(selected_date, "%Y-%m-%d").date()
        except ValueError:
            messages.error(request, "Invalid date format.")
            return redirect("core_url:test_drive", car_id=car1.id)

        booking = TestDriveBooking.objects.create(
            user=request.user,
            car=car1,
            date=selected_date_obj,  # ✅ Store as a date object
            time=selected_time
        )

        return JsonResponse({
            "success": True,
            "redirect_url": reverse("core:car_view", kwargs={"car_id": car1.id})
        })
    return render(request, "core/test_drive.html", {'car': car1, "date_list": date_list, "time_slots": time_slots})


def cancel_test_drive(request, booking_id):
    booking = get_object_or_404(TestDriveBooking, id=booking_id, user=request.user)
    booking.delete()
    messages.success(request, "Test drive booking has been canceled successfully.")
    return redirect('users_url:user_account')


@login_required
def edit_test_drive(request, booking_id):
    booking = get_object_or_404(TestDriveBooking, id=booking_id, user=request.user)

    if request.method == 'POST':
        selected_date = request.POST.get('selected_date')
        selected_time = request.POST.get('selected_time')

        if selected_date and selected_time:
            booking.date = selected_date  # Update date
            booking.time = selected_time  # Update time
            booking.save()  # Save changes in DB
            messages.success(request, "Test drive details updated successfully.")

            # Return JSON response for AJAX requests
            return JsonResponse({"success": True, "message": "Test drive updated successfully."})
        else:
            messages.error(request, "Please select both date and time.")
            return JsonResponse({"success": False, "message": "Date and time required."})

    return redirect('users_url:user_account')



def filtered_cars(request):
    cars = Car.objects.all()  # Show all cars (Available, Sold, Booked)

    # Apply filters
    selected_makes = request.GET.getlist("make")
    if selected_makes:
        cars = cars.filter(make__in=selected_makes)

    selected_fuel = request.GET.get("fuelType")
    if selected_fuel:
        cars = cars.filter(fuel_type=selected_fuel)

    selected_year = request.GET.get("yearType")
    if selected_year:
        cars = cars.filter(registration_year__gte=int(selected_year))

    # Handle price range correctly
    selected_price = request.GET.get("max_price")
    try:
        max_price = int(selected_price) if selected_price else 2000000  # Default max price
    except ValueError:
        max_price = 2000000  # Fallback in case of invalid input

    cars = cars.filter(price__range=(100000, max_price))  # Filter by price range
    cars = cars.annotate(
    status_upper=Upper('status')
    ).annotate(
        status_order=Case(
            When(status_upper="AVAILABLE", then=Value(1)),
            When(status_upper="BOOKED", then=Value(2)),
            When(status_upper="SOLD", then=Value(3)),
            default=Value(4),
            output_field=IntegerField(),
        )
    ).order_by('status_order')

    if not cars.exists():  # If no cars are found
        html = "<p class='fs-5 w-100'>Sorry! No car is available for the selected criteria.<br>Please search again or browse through our similar range of cars.</p>"
    else:
        formatted_data = [
            {
                'car': car,
                'formatted_price': "{:.2f} lakh".format(car.price / 100000)
            } for car in cars
        ]
        html = render_to_string("core/filtered_car_list.html", {"formatted_data": formatted_data}, request=request)

    return JsonResponse({"html": html})



@login_required
def sell_car(request):
    if request.method == "POST":
        make = request.POST.get("make")
        model = request.POST.get("model")
        registration_year = request.POST.get("registration_year")
        fuel_type = request.POST.get("fuel_type")
        transmission_type = request.POST.get("transmission_type")
        kilometers_driven = request.POST.get("kilometers_driven")
        price = request.POST.get("price")
        description = request.POST.get("description")
        image = request.FILES.get("image")

        if make and model and registration_year and fuel_type and price and image:
            car_submission = CarSubmission.objects.create(
                user=request.user,
                make=make,
                model=model,
                registration_year=int(registration_year),
                fuel_type=fuel_type,
                transmission_type=transmission_type,
                kilometers_driven=kilometers_driven,
                price=int(price),
                description=description,
                image=image,
                status="PENDING_APPROVAL"
            )
            messages.success(request, "Your car has been submitted for review. The admin will approve it soon.")
            return redirect("core_url:sell_car")
        else:
            messages.error(request, "All fields are required. Please fill the form correctly.")
        

    return render(request, "core/sell_car.html")



@staff_member_required
def approve_car(request, car_id):
    car_submission = get_object_or_404(CarSubmission, id=car_id)
    car_submission.status = "APPROVED"
    car_submission.save()
    
    # Move car to the main Car model
    from .models import Car
    Car.objects.create(
        make=car_submission.make,
        model=car_submission.model,
        registration_year=car_submission.registration_year,
        fuel_type=car_submission.fuel_type,
        price=car_submission.price,
        description=car_submission.description,
        image=car_submission.image,
        status="AVAILABLE",
    )
    
    messages.success(request, "Car has been approved and added to the website.")
    return redirect("admin_dashboard")

@staff_member_required
def reject_car(request, car_id):
    car_submission = get_object_or_404(CarSubmission, id=car_id)
    car_submission.status = "REJECTED"
    car_submission.save()
    messages.error(request, "Car submission has been rejected.")
    return redirect("admin_dashboard")
