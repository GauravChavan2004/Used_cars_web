from django.urls import path
from core import views
from django.conf import settings
from django.conf.urls.static import static

app_name= 'core_url'
urlpatterns = [
    path('',views.index, name="index" ),
    path('home_page/',views.home_page, name="home_page"),
    path('car_view/<int:car_id>/', views.car_view, name="car_view"),
    path("test_drive/<int:car_id>/", views.test_drive, name="test_drive"),
    path('cancel_test_drive/<int:booking_id>/', views.cancel_test_drive, name='cancel_test_drive'),
    path('edit_test_drive/<int:booking_id>/', views.edit_test_drive, name='edit_test_drive'),
    path("filtered_cars/", views.filtered_cars, name="filtered_cars"),
    path("sell_car/", views.sell_car, name="sell_car"),
    path("admin/approve-car/<int:car_id>/", views.approve_car, name="approve_car"),
    path("admin/reject-car/<int:car_id>/", views.reject_car, name="reject_car"),
] 
if settings.DEBUG: 
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)