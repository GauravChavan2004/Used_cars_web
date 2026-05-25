# Dockerfile
FROM python:3.11

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

# Create media directory
RUN mkdir -p /app/media /app/staticfiles

# ✅ ADD THIS LINE - Copy media files into Docker container
COPY media/ /app/media/

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]