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

# Create your views here.
def index(request):
    return render(request,"core/index.html")

def home_page(request):
    data = Car.objects.all()
    formatted_data = []
    #Filter Backend
    makes = Car.MAKE_CHOICES
    selected_makes = request.GET.getlist('make')  # Get selected makes from the form
    selected_fuel = request.GET.get('fuelType')
    selected_year = request.GET.get('yearType')
    max_price = request.GET.get('max_price', 2000000)  # Default max price
    
    cars = Car.objects.all()

    if selected_makes:
        cars = cars.filter(make__in=selected_makes)

    if selected_fuel:
        cars = cars.filter(fuel_type=selected_fuel)

    if selected_year:
        cars = cars.filter(manufacture_year__gte=int(selected_year))

    if max_price:
        cars = cars.filter(price__lte=int(max_price))



    for car in data:
        lakh_price = car.price / 100000  # Convert the price to lakh
        formatted_price = "{:.2f} lakh".format(lakh_price)  # Format the price
        
        formatted_data.append({
            'car': car,
            'formatted_price': formatted_price
        })
    
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

        # Debugging: Print values to check if they exist
        print(f"Selected Date: {selected_date}, Selected Time: {selected_time}")

        if not selected_date or not selected_time:
            messages.error(request, "Please select both date and time.")
            return redirect("core_url:test_drive", car_id=car1.id)

        booking = TestDriveBooking.objects.create(
            user=request.user,
            car=car1,
            date=selected_date,  # ✅ Ensure this is not None
            time=selected_time    # ✅ Ensure this is not None
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


from django.template.loader import render_to_string

def filtered_cars(request):
    cars = Car.objects.filter(status='AVAILABLE')  # Only show available cars

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
    selected_price = request.GET.get("price-range")  # Get price as string

    try:
        max_price = int(selected_price) if selected_price else 2000000  # Default max price
    except ValueError:
        max_price = 2000000  # Fallback in case of invalid input

    cars = cars.filter(price__gte=100000, price__lte=max_price)  # Filter by price range


    if not cars.exists():  # If no cars are found
        html = "<p class='fs-5 w-100'>Sorry! No car is available for the selected criteria.<br>Please search again or browse through our similar range of cars.</p>"
    else:
        formatted_data = [
            {
                'car': car,
                'formatted_price': indian_format(car.price)
            } for car in cars
        ]
        html = render_to_string("core/filtered_car_list.html", {"formatted_data": formatted_data}, request=request)

    return JsonResponse({"html": html})
