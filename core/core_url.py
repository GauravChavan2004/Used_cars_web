from django.urls import path
from core import views
from django.conf import settings
from django.conf.urls.static import static

app_name= 'core_url'
urlpatterns = [
    path('',views.index ),
    path('home_page/',views.home_page, name="home_page"),
    path('car_view/<int:car_id>/', views.car_view, name="car_view"),
] 
if settings.DEBUG: 
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)