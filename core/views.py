from django.shortcuts import render, get_object_or_404
from core.models import Car


# Create your views here.
def index(request):
    return render(request,"core/index.html")

def home_page(request):
    data = Car.objects.all()
    formatted_data = []
    
    for car in data:
        lakh_price = car.price / 100000  # Convert the price to lakh
        formatted_price = "{:.2f} lakh".format(lakh_price)  # Format the price
        print(formatted_price)
        formatted_data.append({
            'car': car,
            'formatted_price': formatted_price
        })
    
    # Pass only the formatted data to the template
    return render(request, "core/home_page.html", {'formatted_data': formatted_data})

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