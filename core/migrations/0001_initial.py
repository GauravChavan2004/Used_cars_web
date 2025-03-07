# Generated by Django 5.0.6 on 2025-02-12 17:10

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Car',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('make', models.CharField(choices=[('Maruti', 'Maruti'), ('Hyundai', 'Hyundai'), ('Tata', 'Tata'), ('Toyoto', 'Toyota'), ('Honda', 'Honda'), ('Ford', 'Ford'), ('Kia', 'Kia')], max_length=20)),
                ('model', models.CharField(max_length=100)),
                ('registration_month', models.CharField(choices=[('Jan', 'january'), ('Feb', 'Febuary'), ('March', 'March'), ('April', 'April'), ('May', 'may'), ('June', 'June'), ('July', 'July'), ('Aug', 'August'), ('Sep', 'September'), ('Oct', 'October'), ('Nov', 'November'), ('Dec', 'December')], default='january', max_length=20)),
                ('registration_year', models.IntegerField()),
                ('manufacture_year', models.IntegerField()),
                ('owner', models.IntegerField()),
                ('km_driven', models.IntegerField()),
                ('transmission_type', models.CharField(choices=[('Manual', 'Manual'), ('Automatic', 'Automatic')], max_length=20)),
                ('fuel_type', models.CharField(choices=[('Petrol', 'Petrol'), ('Diesel', 'Diesel'), ('Petrol+CNG', 'Petrol+CNG'), ('ELECTRIC', 'Electric')], max_length=20)),
                ('insurance_validity', models.CharField(max_length=100)),
                ('insurance_type', models.CharField(choices=[('Comprehensive', 'Comprehensive'), ('Third-Party', 'Third-Party')], max_length=20)),
                ('RTO', models.CharField(max_length=20)),
                ('price', models.DecimalField(decimal_places=2, max_digits=10)),
                ('car_location', models.CharField(max_length=100)),
                ('car_img', models.ImageField(default='media\\default_img\\default_img.png', help_text='Upload an image of the car for the display view.', upload_to='title_car/')),
                ('status', models.CharField(choices=[('AVAILABLE', 'Available'), ('BOOK', 'Book'), ('SOLD', 'Sold')], default='AVAILABLE', max_length=20)),
            ],
        ),
        migrations.CreateModel(
            name='CarImage',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(help_text='Upload an image of the car.', upload_to='cars/')),
                ('description', models.CharField(blank=True, help_text='Description of the image (optional).', max_length=255)),
                ('car', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='images', to='core.car')),
            ],
        ),
    ]
