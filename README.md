# Flowback simple setup

Here is a simple docker setup. 
Requires git and docker. 

```bash
git clone https://github.com/Kattenelvis/flowback-docker/
cd flowback-docker
docker compose up -d
```


If you want too reverse proxy Do this on Caddy running on systemd

```Caddyfile
flowback-example.com {
reverse_proxy localhost:8085
}
```
