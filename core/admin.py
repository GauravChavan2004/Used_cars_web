from django.contrib import admin

# Register your models here.
from .models import Car, CarImage

class CarImageInline(admin.TabularInline):
    model = CarImage
    extra = 1  # Number of empty image fields to show by default

class CarAdmin(admin.ModelAdmin):
    list_display = ('make', 'model', 'registration_year', 'km_driven', 'price', 'car_location', 'owner','status')
    list_filter = ('make', 'fuel_type', 'transmission_type', 'insurance_type','status')
    search_fields = ('make', 'model', 'car_location')
    ordering = ('-registration_year',)  # Display cars in reverse order of registration year
    inlines = [CarImageInline]



admin.site.register(Car, CarAdmin)
admin.site.register(CarImage)