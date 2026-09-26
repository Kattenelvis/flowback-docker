# Flowback simple setup

Requires Git and Docker.

```bash
git clone https://github.com/Kattenelvis/flowback-docker/
cd flowback-docker
cp .env.example .env
# Pull and start the published images
docker compose pull flowback-frontend flowback-backend flowback-postgresql flowback-redis
docker compose up -d --no-build flowback-frontend flowback-backend flowback-postgresql flowback-redis

# Build and start Caddy
docker compose build caddy
docker compose up -d --no-build caddy
```

Update `PUBLIC_API_URL` in `.env` before starting if needed.

Create a superuser:

```bash
chmod +x ./create_superuser.bash
bash ./create_superuser.bash
```

## Development

Requires `flowback-frontend` and `flowback-backend` cloned next to this repo. Code changes in either reload automatically at http://localhost:8085.

```bash
./dev.sh
```

Follow logs:

```bash
docker compose -f docker-compose.yml -f docker-compose.dev.yml logs -f flowback-frontend flowback-backend
```

Celery doesn't auto-reload; restart it after changing tasks:

```bash
docker compose -f docker-compose.yml -f docker-compose.dev.yml restart flowback-celery-worker flowback-celery-beat
```

For a Caddy reverse proxy running on the host:

```caddyfile
flowback-example.com {
    reverse_proxy localhost:8085
}
```
