# Generated by Django 5.0.6 on 2025-03-06 15:36

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_alter_car_car_img_testdrivebooking'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='testdrivebooking',
            options={'ordering': ['-date', '-created_at']},
        ),
    ]
