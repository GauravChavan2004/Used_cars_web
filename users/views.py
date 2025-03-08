from django.shortcuts import render, redirect
from django.contrib.auth.models import User, auth
from django.contrib import messages
from django.contrib.auth import logout
from django.contrib.auth.decorators import login_required
from django.utils.http import urlsafe_base64_encode, urlsafe_base64_decode
from django.utils.encoding import force_bytes, force_str
from django.template.loader import render_to_string
from django.contrib.auth.tokens import default_token_generator
from django.core.mail import send_mail
from django.conf import settings
from .forms import PasswordResetRequestForm, SetNewPasswordForm
from .models import UserProfile
from core.models import TestDriveBooking, Car
from datetime import datetime, timedelta




#@login_required
def user_register(request):
    if request.method=='POST':
        first_name=request.POST['first_name']
        last_name=request.POST['last_name']
        email=request.POST['email']
        username=request.POST['username']
        password1=request.POST['password1']
        password2=request.POST['password2']     
        mobile_number = request.POST['mobile_number']

        # Check if passwords match
        if password1 != password2:
            messages.error(request, 'Passwords do not match')
            return redirect('users/user_register')
        
        # Check if username or email already exists
        if User.objects.filter(username=username).exists():
            messages.error(request, 'Username already taken')
            return redirect('users_url:user_register')
        elif User.objects.filter(email=email).exists():
            messages.error(request, 'Email is already registered')
            return redirect('users_url:user_register')
        
        if UserProfile.objects.filter(mobile_number=mobile_number).exists():
            messages.error(request, 'Mobile number is already registered')
            return redirect('users_url:user_register')

        user = User.objects.create_user(
            first_name=first_name,
            last_name=last_name,
            email=email,
            username=username,
            password=password1
        )
        user.save()
        UserProfile.objects.create(user=user, mobile_number=mobile_number)
        messages.success(request, 'Account created successfully. You can now log in.')
        return redirect('users_url:user_login')
    return render(request, 'users/register.html')

def user_login(request):
    if request.method=='POST':
        username=request.POST['username']
        password=request.POST['password']
        user= auth.authenticate(username=username,password=password)

        if user is not None:
            auth.login(request,user)
            return redirect('/')
        else:
            messages.error(request, 'Invalid username and password !!')
            return redirect('users_url:user_login')
        
    return render(request, 'users/login.html')

def user_logout(request):
    logout(request)
    messages.success(request, "You have successfully logged out.")
    return redirect('users_url:user_login')

def user_otp(request):
    return render(request, 'users/user_account_details.html')

#forgot Password
def password_reset_request(request):
    if request.method == "POST":
        form = PasswordResetRequestForm(request.POST)
        if form.is_valid():
            email = form.cleaned_data["email"]
            user = User.objects.filter(email=email).first()
            if user:
                uidb64 = urlsafe_base64_encode(force_bytes(user.pk))
                token = default_token_generator.make_token(user)
                reset_url = request.build_absolute_uri(f"/user/reset/{uidb64}/{token}/")  


                # Send email
                subject = "Password Reset Request"
                message = render_to_string("users/forget_password/password_reset_email.html", {
                    "reset_url": reset_url,
                    "user": user
                })
                send_mail(
                    subject,
                    "",  # Plain text version (leave empty if not needed)
                    settings.DEFAULT_FROM_EMAIL,
                    [user.email],
                    html_message=message  
                )


                messages.success(request, "Password reset email sent! Check your inbox.")
                return redirect("users_url:password_reset_done")
            else:
                messages.error(request, "No account found with this email.")
    else:
        form = PasswordResetRequestForm()
    
    return render(request, "users/forget_password/password_reset_request.html", {"form": form})

def password_reset_done(request):
    return render(request, "users/forget_password/password_reset_done.html")


def password_reset_confirm(request, uidb64, token):
    try:
        uid = force_str(urlsafe_base64_decode(uidb64))
        user = User.objects.get(pk=uid)
    except (TypeError, ValueError, OverflowError, User.DoesNotExist):
        user = None

    if user and default_token_generator.check_token(user, token):
        if request.method == "POST":
            form = SetNewPasswordForm(request.POST)
            if form.is_valid():
                user.set_password(form.cleaned_data["new_password"])
                user.save()
                messages.success(request, "Password reset successful! You can now log in.")
                return redirect("users_url:password_reset_complete")
        else:
            form = SetNewPasswordForm()
        return render(request, "users/forget_password/password_reset_confirm.html", {"form": form})
    else:
        messages.error(request, "Invalid or expired reset link.")
        return redirect("users_url:password_reset")

def password_reset_complete(request):
    return render(request, "users/forget_password/password_reset_complete.html")


# import json
# from django.http import JsonResponse
# from firebase_admin import auth

# def send_otp(request):
#     """Send OTP using Firebase"""
#     try:
#         data = json.loads(request.body)
#         phone_number = data.get("phone_number")

#         # Firebase sends OTP automatically
#         return JsonResponse({"message": "OTP sent successfully!", "phone_number": phone_number})

#     except Exception as e:
#         return JsonResponse({"error": str(e)}, status=400)

# def verify_otp(request):
#     """Verify OTP using Firebase"""
#     try:
#         data = json.loads(request.body)
#         id_token = data.get("id_token")  # OTP verification token from frontend

#         # Verify OTP
#         decoded_token = auth.verify_id_token(id_token)
#         uid = decoded_token["uid"]

#         return JsonResponse({"message": "OTP verified!", "uid": uid})

#     except Exception as e:
#         return JsonResponse({"error": "Invalid OTP"}, status=400)

def user_account(request):
    user = request.user  # Get the logged-in user

    # Fetch only the logged-in user's test drive bookings
    test_drive_bookings = TestDriveBooking.objects.filter(user=user).select_related('car')

    # Add formatted price to each booking's car dynamically
    for booking in test_drive_bookings:
        booking.car.formatted_price = "{:.2f} lakh".format(booking.car.price / 100000)

    # Generate dates (next 4 days)
    date_list = [
        {
            "date": (datetime.today() + timedelta(days=i)).strftime("%Y-%m-%d"),
            "weekday": (datetime.today() + timedelta(days=i)).strftime("%a"),
            "day": (datetime.today() + timedelta(days=i)).strftime("%d"),
            "month": (datetime.today() + timedelta(days=i)).strftime("%b")
        }
        for i in range(4)
    ]

    # Define time slots
    time_slots = ["10 AM - 11 AM", "11 AM - 12 PM", "12 PM - 1 PM",
                  "2 PM - 3 PM", "3 PM - 4 PM", "4 PM - 5 PM"]

    return render(request, "users/user_account_details.html", {
        'user': user,
        'test_drive_bookings': test_drive_bookings,
        'date_list': date_list,
        'time_slots': time_slots
    })

@login_required
def edit_profile(request):
    user = request.user
    try:
        user_profile = user.userprofile
    except UserProfile.DoesNotExist:
        user_profile = UserProfile.objects.create(user=user)

    if request.method == 'POST':
        first_name = request.POST.get('first_name')
        last_name = request.POST.get('last_name')
        email = request.POST.get('email')
        mobile_number = request.POST.get('mobile_number')

        user.first_name = first_name
        user.last_name = last_name
        user.email = email
        user_profile.mobile_number = mobile_number

        user.save()
        user_profile.save()

        messages.success(request, 'Your profile has been updated successfully!')
        return redirect('users_url:edit_profile')

    return render(request, 'users/edit_profile.html', {'user': user, 'user_profile': user_profile})
