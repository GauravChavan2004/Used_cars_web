from django.urls import path
from users import views
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth import views as auth_views


app_name= 'users_url'
urlpatterns = [
    path('user_register/', views.user_register, name='user_register'),
    path('user_login/', views.user_login, name='user_login'),
    path('user_logout/', views.user_logout, name='user_logout'),
    path('user_account/',views.user_account,name='user_account'), 
    path('edit_profile/', views.edit_profile, name='edit_profile'),
    #path("send-otp/", views.send_otp, name="send_otp"),
    #path("verify-otp/", views.verify_otp, name="verify_otp"),
    #path('user_otp/', views.user_otp, name='user_otp'),
    path('password_reset/', views.password_reset_request, name='password_reset'),
    path('reset/<uidb64>/<token>/', views.password_reset_confirm, name='password_reset_confirm'),
    path('password_reset_done/', views.password_reset_done, name='password_reset_done'),
    path('password_reset_complete/', views.password_reset_complete, name='password_reset_complete'),
]

if settings.DEBUG: 
    urlpatterns += static(settings.MEDIA_URL,
                          document_root=settings.MEDIA_ROOT)