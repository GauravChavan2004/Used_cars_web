from django.db.models.signals import post_save
from django.dispatch import receiver
from django.core.mail import send_mail
from .models import TestDriveBooking
from django.conf import settings
from datetime import datetime, time
from django.utils.html import strip_tags
from .models import CarSubmission

@receiver(post_save, sender=TestDriveBooking)
def notify_admin_test_drive(sender, instance, created, **kwargs):
    admin_email = settings.ADMIN_EMAIL
    user_email= instance.user.email 
    user_name = instance.user.get_full_name() or instance.user.username

    if created:
        formatted_date = instance.date.strftime('%d %b %Y')
        formatted_time = instance.time if instance.time else "N/A"

        
        subject = "🚗 New Test Drive Booking Request"

        html_message = f"""
        <html>
        <body>
            <p>Dear Admin,</p>

            <p>A new test drive request has been made.</p>

            <p>📌 <b>Customer Name:</b> {instance.user.get_full_name() or instance.user.username} <br>
            🚘 <b>Car Model:</b> {instance.car} <br>
            📅 <b>Scheduled Date & Time:</b> {formatted_date}, {formatted_time}</p>

            <p>Please review the test drive booking in the admin panel.</p>

            <p>Regards, <br>
            One Point Car Mall Team</p>
        </body>
        </html>
        """

        # Send email
        send_mail(
            subject=subject,
            message=strip_tags(html_message),
            from_email=settings.EMAIL_HOST_USER,
            recipient_list=[admin_email],
            html_message=html_message
        )
        # 2️⃣ User Confirmation Email with Full Details
    if user_email:
        user_subject = "✅ Your Test Drive Booking is Confirmed!"
        user_html = f"""
        <html><body>
            <p>Dear {user_name},</p>

            <p>Thank you for booking a test drive with <strong>One Point Car Mall</strong>.</p>

            <p>Your booking has been <strong>successfully confirmed</strong>. Below are the details:</p>

            <h3>📅 Test Drive Booking Details:</h3>
            <ul>
                <li><strong>Date:</strong> {formatted_date}</li>
                <li><strong>Time:</strong> {formatted_time}</li>
            </ul>

            <h3>🚘 Car Details:</h3>
            <ul>
                <li><strong>Make:</strong> {instance.car.make}</li>
                <li><strong>Model:</strong> {instance.car.model}</li>
                <li><strong>Registration:</strong> {instance.car.registration_month} {instance.car.registration_year}</li>
                <li><strong>Fuel Type:</strong> {instance.car.fuel_type}</li>
                <li><strong>Transmission:</strong> {instance.car.transmission_type}</li>
                <li><strong>Owner:</strong> {instance.car.owner}</li>
                <li><strong>KM Driven:</strong> {instance.car.km_driven} km</li>
                <li><strong>Location:</strong> {instance.car.car_location}</li>
                <li><strong>Insurance:</strong> {instance.car.insurance_type} (Valid till {instance.car.insurance_validity})</li>
                <li><strong>Price:</strong> ₹{instance.car.price:,.2f}</li>
            </ul>
            <p>We are excited to assist you in experiencing your future ride.</p>
            <p>For any queries, feel free to contact us.</p>

            <p>Warm regards,<br>
            <strong>One Point Car Mall Team</strong></p>
        </body></html>
        """

        send_mail(
            subject=user_subject,
            message=strip_tags(user_html),
            from_email=settings.EMAIL_HOST_USER,
            recipient_list=[user_email],
            html_message=user_html
        )


@receiver(post_save, sender=CarSubmission)
def notify_admin_car_submission(sender, instance, created, **kwargs):
    seller_email = instance.user.email 
    admin_email = settings.ADMIN_EMAIL

    if created:  # Only notify for new submissions
        subject = "🚗 New Car Submission Request"

        html_message = f"""
        <html>
        <body>
            <p>Dear Admin,</p>

            <p>A new car submission request has been made for review.</p>

            <p>📌 <b>Seller Name:</b> {instance.user.get_full_name() or instance.user.username} <br>
            🚘 <b>Car Model:</b> {instance.make} {instance.model} ({instance.registration_year}) <br>
            💰 <b>Expected Price:</b> ₹{instance.price:,} <br>
            📅 <b>Submission Date:</b> {instance.created_at.strftime('%d %b %Y')}</p>

            <p>Please review the car listing in the admin panel.</p>

            <p>Regards, <br>
            One Point Car Mall Team</p>
        </body>
        </html>
        """

        # Send email to the admin
        send_mail(
            subject=subject,
            message=strip_tags(html_message),  # Fallback to plain text
            from_email=settings.EMAIL_HOST_USER,
            recipient_list=[admin_email],
            html_message=html_message  # HTML version
        )
    else:
        # Notify seller if the status changes to APPROVED
        if instance.status == "APPROVED":
            subject = "✅ Your Car Submission Has Been Approved!"
            html_message = f"""
            <html>
            <body>
                <p>Dear {instance.seller_first_name()},</p>
                <p>Great news! Your car submission has been <b>approved</b> by the admin.</p>
                <p>🚘 <b>Car Model:</b> {instance.make} {instance.model} ({instance.registration_year}) <br>
                💰 <b>Expected Price:</b> ₹{instance.price:,} <br>
                📅 <b>Approval Date:</b> {instance.created_at.strftime('%d %b %Y')}</p>
                <p>Your listing is now live on our platform. Thank you for using our service!</p>
                <p>Regards, <br>One Point Car Mall Team</p>
            </body>
            </html>
            """
            send_mail(
                subject=subject,
                message=strip_tags(html_message),
                from_email=settings.EMAIL_HOST_USER,
                recipient_list=[seller_email],
                html_message=html_message
            )

        # Notify seller if the status changes to REJECTED
        elif instance.status == "REJECTED":
            subject = "❌ Your Car Submission Has Been Rejected"
            html_message = f"""
            <html>
            <body>
                <p>Dear {instance.seller_first_name()},</p>
                <p>Unfortunately, your car submission has been <b>rejected</b> by the admin.</p>
                <p>🚘 <b>Car Model:</b> {instance.make} {instance.model} ({instance.registration_year}) <br>
                💰 <b>Expected Price:</b> ₹{instance.price:,} <br>
                📅 <b>Submission Date:</b> {instance.created_at.strftime('%d %b %Y')}</p>
                <p>If you have any questions or wish to update your submission, please contact our support team.</p>
                <p>Regards, <br>One Point Car Mall Team</p>
            </body>
            </html>
            """
            send_mail(
                subject=subject,
                message=strip_tags(html_message),
                from_email=settings.EMAIL_HOST_USER,
                recipient_list=[seller_email],
                html_message=html_message
            )