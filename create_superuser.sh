#!/bin/bash
# Create Django superuser in the flowback-backend Docker container

read -p "Email: " EMAIL
read -p "Username: " USERNAME
read -s -p "Password: " PASSWORD
echo

docker compose exec \
  -e DJANGO_SUPERUSER_EMAIL="$EMAIL" \
  -e DJANGO_SUPERUSER_USERNAME="$USERNAME" \
  -e DJANGO_SUPERUSER_PASSWORD="$PASSWORD" \
  flowback-docker-flowback-backend-1 \
  python manage.py createsuperuser --noinput
