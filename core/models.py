from django.db import models
from django.contrib.auth.models import User
import re
class Car(models.Model):
    MAKE_CHOICES = [
        ('Maruti', 'Maruti'),
        ('Hyundai', 'Hyundai'),
        ('Tata', 'Tata'),
        ('Toyoto', 'Toyota'),
        ('Honda', 'Honda'),
        ('Ford', 'Ford'),
        ('Kia', 'Kia'),
        # Add more makes as needed
    ]
    reg_month_CHOICES = [
        ('Jan', 'january'),
        ('Feb', 'Febuary'),
        ('March', 'March'),
        ('April', 'April'),
        ('May', 'may'),
        ('June', 'June'),
        ('July', 'July'),
        ('Aug', 'August'),
        ('Sep', 'September'),
        ('Oct', 'October'),
        ('Nov', 'November'),
        ('Dec', 'December'),
        # Add more makes as needed
    ]

    
    make = models.CharField(max_length=20, choices=MAKE_CHOICES)
    model = models.CharField(max_length=100)
    registration_month = models.CharField(max_length=20, choices=reg_month_CHOICES, default="january")
    registration_year = models.IntegerField()
    manufacture_year = models.IntegerField()
    owner = models.IntegerField()
    km_driven = models.IntegerField()
    transmission_type = models.CharField(max_length=20, choices=[('Manual', 'Manual'), ('Automatic', 'Automatic')])
    fuel_type = models.CharField(max_length=20, choices=[('Petrol', 'Petrol'), ('Diesel', 'Diesel'),('Petrol+CNG', 'Petrol+CNG'), ('ELECTRIC', 'Electric')])
    insurance_validity = models.CharField(max_length=100)
    insurance_type = models.CharField(max_length=20, choices=[('Comprehensive', 'Comprehensive'), ('Third-Party', 'Third-Party')])
    RTO = models.CharField(max_length=20)
    price = models.DecimalField(max_digits=10, decimal_places=2)
    car_location = models.CharField(max_length=100)
    car_img=models.ImageField(upload_to='title_car/',default='media\default_img\default_img.png', help_text="Upload an image of the car for the display view.")
    status = models.CharField(max_length=20, choices=[('AVAILABLE', 'Available'), ('BOOK', 'Book'),('SOLD', 'Sold')], default="AVAILABLE")

    def __str__(self):
        return f"{self.make} {self.model} ({self.registration_year})"
    
class CarImage(models.Model):
    car = models.ForeignKey(Car, related_name='images', on_delete=models.CASCADE)
    image = models.ImageField(upload_to='cars/', help_text="Upload an image of the car.")
    description = models.CharField(max_length=255, blank=True, help_text="Description of the image (optional).")

    def __str__(self):
        return f"Image of {self.car.make} {self.car.model} ({self.id})"