# docker-mumble-server

* Uses latest mumble-server package on Ubuntu
* Mounts /data - this folder is expected to contain your mumble-server.ini file
* Runs as user "mumble" with ID 474

## Example Stack YAML

```yaml
version: '3'
services:
  mumble:
    image: alanedwardes/docker-mumble-server:latest
    deploy:
      restart_policy:
        condition: any
    ports:
      - 64738:64738
    volumes:
      - /host/path/to/data:/data
    deploy:
      resources:
        limits:
          cpus: '0.2'
          memory: 64M
```

Start this stack using `docker stack deploy -c stack.yml mumble`
