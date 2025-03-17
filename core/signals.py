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
    if created:
        formatted_date = instance.date.strftime('%d %b %Y')
        formatted_time = instance.time if instance.time else "N/A"

        admin_email = settings.ADMIN_EMAIL
        subject = "🚗 New Test Drive Booking Request"

        html_message = f"""
        <html>
        <body>
            <p>Dear Admin,</p>

            <p>A new test drive request has been made.</p>

            <p>📌 <b>Customer Name:</b> {instance.user.get_full_name() or instance.user.username} <br>
            🚘 <b>Car Model:</b> {instance.car} <br>
            📅 <b>Scheduled Date & Time:</b> {formatted_date}, {formatted_time}</p>

            <p>Please review the booking in the admin panel.</p>

            <p>Regards, <br>
            Your Website Team</p>
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

@receiver(post_save, sender=CarSubmission)
def notify_admin_car_submission(sender, instance, created, **kwargs):
    if created:  # Only notify for new submissions
        admin_email = settings.ADMIN_EMAIL  # Set this in settings.py
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
            Your Website Team</p>
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