from django.contrib import admin
from users.models import UserProfile  # Import UserProfile
from django.utils.timezone import now
from django.db.models import Case, When, Value, IntegerField

# Register your models here.
from .models import Car, CarImage,TestDriveBooking

class CarImageInline(admin.TabularInline):
    model = CarImage
    extra = 1  # Number of empty image fields to show by default

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

    
    


admin.site.register(Car, CarAdmin)
admin.site.register(CarImage)