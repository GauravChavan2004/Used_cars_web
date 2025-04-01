from django.contrib import admin
from users.models import UserProfile  # Import UserProfile
from django.utils.timezone import now
from django.db.models import Case, When, Value, IntegerField
from .models import CarSubmission
from django.utils.safestring import mark_safe
from .models import Car, CarImage,TestDriveBooking

class CarImageInline(admin.TabularInline):
    model = CarImage
    extra = 1  

class CarAdmin(admin.ModelAdmin):
    list_display = ('make', 'model', 'registration_year', 'km_driven', 'price', 'car_location', 'owner','status')
    list_filter = ('make', 'fuel_type', 'transmission_type', 'insurance_type','status')
    search_fields = ('make', 'model', 'car_location')
    ordering = ('-registration_year',)  # Display cars in reverse order of registration year
    inlines = [CarImageInline]



@admin.register(TestDriveBooking)
class TestDriveBookingAdmin(admin.ModelAdmin):
    list_display = ('user', 'get_mobile_number', 'car', 'date', 'time', 'status')
    list_filter = ('date', 'car')
    search_fields = ('user__username', 'car__make', 'car__model', 'user__userprofile__mobile_number')

    def get_mobile_number(self, obj):
        """Fetch mobile number from UserProfile"""
        return obj.user.userprofile.mobile_number if hasattr(obj.user, 'userprofile') else 'N/A'

    get_mobile_number.short_description = "Mobile Number"  # Set column title

    def get_queryset(self, request):
        """Ensure current date test drives appear first, followed by future dates in ascending order."""
        qs = super().get_queryset(request).filter(date__gte=now().date())

        # Priority: Today's date first (0), then future dates (1)
        qs = qs.annotate(
            priority=Case(
                When(date=now().date(), then=Value(0)),  # Highest priority for today
                default=Value(1),  # Future dates lower priority
                output_field=IntegerField()
            )
        ).order_by('priority', 'date', 'time')  # Today's first, then ascending dates

        return qs


@admin.register(CarSubmission)
class CarSubmissionAdmin(admin.ModelAdmin):
    list_display = ("make", "model", "price", "seller_first_name", "seller_last_name", "seller_mobile_number", "status", "car_image_preview")
    list_filter = ("status", "created_at")
    actions = ["approve_selected", "reject_selected"]

    def approve_selected(self, request, queryset):
        for car_submission in queryset:
            if car_submission.status != "APPROVED":
                car_submission.status = "APPROVED"
                car_submission.save()

                # Move to Car model
                Car.objects.create(
                    make=car_submission.make,
                    model=car_submission.model,
                    registration_year=car_submission.registration_year,
                    fuel_type=car_submission.fuel_type,
                    price=car_submission.price,
                    car_img=car_submission.image,  # Ensure this matches the Car model
                    status="AVAILABLE",
                    owner=1,  # Default value (Update this as needed)
                    km_driven=0,  # Default value (Update this as needed)
                    transmission_type="Manual",  # Default value
                    insurance_validity="Not Specified",  # Default
                    insurance_type="Third-Party",  # Default
                    RTO="Not Provided",  # Default
                    manufacture_year=car_submission.registration_year,  # Assuming manufacture year is the same
                    car_location="Not Provided"  # Default
                )

        self.message_user(request, "Selected cars approved and added to the website.")

    def reject_selected(self, request, queryset):
        queryset.update(status="REJECTED")
        self.message_user(request, "Selected cars rejected.")

    approve_selected.short_description = "Approve selected cars"
    reject_selected.short_description = "Reject selected cars"

    # Show Image Preview in Admin Panel
    def car_image_preview(self, obj):
        if obj.image:
            return mark_safe(f'<a href="{obj.image.url}" target="_blank"><img src="{obj.image.url}" width="100" height="75" style="border-radius:5px;"/></a>')
        return "No Image"

    car_image_preview.allow_tags = True
    car_image_preview.short_description = "Car Image"

admin.site.register(Car, CarAdmin)