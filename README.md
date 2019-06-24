# docker-mailcatcher
An Alpine Linux based Docker container providing a mailcatcher for development environments.

It listens for SMTP connections on port 1025 and provides a frontend interface on port 1080.

## Usage

### ... via [`docker container run`](https://docs.docker.com/engine/reference/commandline/container_run/)

```
docker container run -p 1025:1025 -p 1080:1080 shuppet/mailcatcher:latest
```

### ... via [`docker stack deploy`](https://docs.docker.com/engine/reference/commandline/stack_deploy/) or [`docker-compose`](https://github.com/docker/compose)

```yaml
services:
  mailcatcher:
    image: shuppet/mailcatcher:0.7.1
    ports:
    - 0.0.0.0:1025:1025/tcp
    - 0.0.0.0:1080:1080/tcp
version: '3.7'
```

### How to build the image from source

You must provide two build-time arguments when building this Docker image, `BUILD_DATE` and `BUILD_VERSION`.
```bash
docker build \
  --build-arg BUILD_DATE=$(date -u +'%Y-%m-%dT%H:%M:%SZ') \
  --build-arg BUILD_VERSION=0.7.1 \
  -t shuppet/mailcatcher:0.7.1 \
  -t shuppet/mailcatcher:latest \
  $PWD
```
Then the resulting image can be pushed to the [`shuppet/mailcatcher`](https://cloud.docker.com/u/shuppet/repository/docker/shuppet/mailcatcher) Docker Hub repository:
```
docker push shuppet/mailcatcher:0.7.1
```
