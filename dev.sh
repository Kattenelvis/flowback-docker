#!/bin/bash
# Start Flowback in dev mode with live reload for frontend and backend
docker compose -f docker-compose.yml -f docker-compose.dev.yml up --build -d "$@"
