from django.db import models
from django.contrib.auth.models import User
from users.models import UserProfile
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
        ('Renault', 'Renault'),
        ('Skoda', 'Skoda'),
        ('Mahindra', 'Mahindra'),
        ('Nissan', 'Nissan'),
        ('Volkswagen', 'Volkswagen'),
        ('MG', 'MG'),
        ('Jeep', 'Jeep'),

        # Add more makes as needed
    ]
    reg_month_CHOICES = [
        ('Jan', 'january'),
        ('Feb', 'February'),
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
    registration_month = models.CharField(max_length=20, choices=reg_month_CHOICES, default="jan")
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
    car_img=models.ImageField(upload_to='title_car/',default='media/default_img/default_img.png', help_text="Upload an image of the car for the display view.")
    status = models.CharField(max_length=20, choices=[('AVAILABLE', 'Available'), ('BOOKED', 'Booked'),('SOLD', 'Sold')], default="AVAILABLE")

    def __str__(self):
        return f"{self.make} {self.model} ({self.registration_year})"
    
class CarImage(models.Model):
    car = models.ForeignKey(Car, related_name='images', on_delete=models.CASCADE)
    image = models.ImageField(upload_to='cars/', help_text="Upload an image of the car.")
    description = models.CharField(max_length=255, blank=True, help_text="Description of the image (optional).")

    def __str__(self):
        return f"Image of {self.car.make} {self.car.model} ({self.id})"
    
class TestDriveBooking(models.Model):
    STATUS_CHOICES = [
        ('PENDING', 'Pending'),
        ('CONFIRMED', 'Confirmed'),
        ('COMPLETED', 'Completed'),
        ('CANCELED', 'Canceled')
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE)  # User who booked
    car = models.ForeignKey(Car, on_delete=models.CASCADE)  # Car being booked
    date = models.DateField()  # Selected test drive date
    time = models.CharField(max_length=20)  # Selected time slot
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default="PENDING")
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        # Fetch the mobile number from UserProfile, handle cases where it doesn't exist
        mobile_number = getattr(self.user.userprofile, 'mobile_number', 'N/A')
        return f"{self.user.username} ({mobile_number}) - {self.car.make} {self.car.model} - {self.date} at {self.time}"
    
# sell car model    
class CarSubmission(models.Model):
    STATUS_CHOICES = [
        ('PENDING_APPROVAL', 'Pending Approval'),
        ('APPROVED', 'Approved'),
        ('REJECTED', 'Rejected'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE)  # Seller
    make = models.CharField(max_length=50)
    model = models.CharField(max_length=100)
    registration_year = models.IntegerField()
    fuel_type = models.CharField(max_length=20)
    transmission_type = models.CharField(max_length=20, default='Manual')
    kilometers_driven = models.CharField(max_length=20, default='0') 
    price = models.IntegerField()
    description = models.TextField()
    image = models.ImageField(upload_to='car_submissions/')
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='PENDING_APPROVAL')
    created_at = models.DateTimeField(auto_now_add=True)
    def seller_first_name(self):
        return self.user.first_name

    def seller_last_name(self):
        return self.user.last_name

    def seller_mobile_number(self):
        """Safely retrieve the mobile number from UserProfile."""
        user_profile = UserProfile.objects.filter(user=self.user).first()
        return user_profile.mobile_number if user_profile else "N/A" 

    def __str__(self):
        return f"{self.make} {self.model} - {self.status}"
