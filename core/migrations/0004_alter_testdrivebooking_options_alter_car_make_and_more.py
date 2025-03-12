# Generated by Django 5.0.6 on 2025-03-10 05:58

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_alter_testdrivebooking_options'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='testdrivebooking',
            options={},
        ),
        migrations.AlterField(
            model_name='car',
            name='make',
            field=models.CharField(choices=[('Maruti', 'Maruti'), ('Hyundai', 'Hyundai'), ('Tata', 'Tata'), ('Toyoto', 'Toyota'), ('Honda', 'Honda'), ('Ford', 'Ford'), ('Kia', 'Kia'), ('Renault', 'Renault'), ('Skoda', 'Skoda'), ('Mahindra', 'Mahindra'), ('Nissan', 'Nissan'), ('Volkswagen', 'Volkswagen'), ('MG', 'MG'), ('Jeep', 'Jeep')], max_length=20),
        ),
        migrations.AlterField(
            model_name='car',
            name='registration_month',
            field=models.CharField(choices=[('Jan', 'january'), ('Feb', 'February'), ('March', 'March'), ('April', 'April'), ('May', 'may'), ('June', 'June'), ('July', 'July'), ('Aug', 'August'), ('Sep', 'September'), ('Oct', 'October'), ('Nov', 'November'), ('Dec', 'December')], default='jan', max_length=20),
        ),
        migrations.CreateModel(
            name='CarSubmission',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('make', models.CharField(max_length=50)),
                ('model', models.CharField(max_length=100)),
                ('registration_year', models.IntegerField()),
                ('fuel_type', models.CharField(max_length=20)),
                ('price', models.IntegerField()),
                ('description', models.TextField()),
                ('image', models.ImageField(upload_to='car_submissions/')),
                ('status', models.CharField(choices=[('PENDING_APPROVAL', 'Pending Approval'), ('APPROVED', 'Approved'), ('REJECTED', 'Rejected')], default='PENDING_APPROVAL', max_length=20)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
