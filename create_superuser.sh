#!/bin/bash
# Create Django superuser in the flowback-backend Docker container

docker exec -it \
  flowback-docker-flowback-backend-1 \
  python manage.py createsuperuser
