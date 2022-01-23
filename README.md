# docker-glowing-bear

[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/j33r/glowing-bear?style=flat-square)](https://microbadger.com/images/j33r/glowing-bear)
[![DockerHub](https://img.shields.io/badge/Dockerhub-j33r/glowing-bear-%232496ED?logo=docker&style=flat-square)](https://hub.docker.com/r/j33r/glowing-bear)
[![ghcr.io](https://img.shields.io/badge/ghrc%2Eio-jee%2D-r/glowing-bear-%232496ED?logo=github&style=flat-square)](https://ghcr.io/jee-r/glowing-bear)

A docker image for [glowing-bear](https://github.com/glowing-bear/glowing-bear) ![glowing-bear logo](https://raw.githubusercontent.com/glowing-bear/glowing-bear/master/src/assets/img/favicon.png)

# Supported tags

| Tags | Size | Platformss | Build |
|-|-|-|-|
| `latest`, `stable` | ![](https://img.shields.io/docker/image-size/j33r/glowing-bear/latest?style=flat-square) | `amd64` | ![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/jee-r/docker-glowing-bear/Deploy/master?style=flat-square)
| `dev` | ![](https://img.shields.io/docker/image-size/j33r/glowing-bear/dev?style=flat-square) | `amd64` | ![GitHub Workflow Status (branch)](https://img.shields.io/github/workflow/status/jee-r/docker-glowing-bear/Deploy/dev?style=flat-square) | 

# What is glowing-bear ?

From [github.com/glowing-bear/glowing-bear](https://github.com/glowing-bear/glowing-bear):

> Glowing Bear is a web frontend for the WeeChat IRC client and strives to be a modern interface. It relies on WeeChat to do all the heavy lifting and then provides some nice features on top of that, like embedding images, videos, and other content. The best part, however, is that you can use it from any modern internet device -- whether it's a computer, tablet, or smart phone -- and all your stuff is there, wherever you are. You don't have to deal with the messy technical details, and all you need to have installed is a browser or our app.

- Source Code : https://github.com/glowing-bear/glowing-bear
- Official Website : https://glowing-bear.org

# How to use these images

All the lines commented in the examples below should be adapted to your environment. 

Note: this image is based on latest [nginxinc/nginx-unprivileged](https://github.com/nginxinc/docker-nginx-unprivileged) 

## With Docker

```bash
docker run \
    --detach \
    --interactive \
    --name glowing-bear \
    --volume /etc/localtime:/etc/localtime:ro \
    --env TZ=Europe/Paris \
    --publish 8080:8080 \
    j33r/glowing-bear:latest
```

## With Docker Compose

[`docker-compose`](https://docs.docker.com/compose/) can help with defining the `docker run` config in a repeatable way rather than ensuring you always pass the same CLI arguments.

Here's an example `docker-compose.yml` config:

```yaml
version: '3'

services:
  glowing-bear:
    image: j33r/glowing-bear:latest
    container_name: glowing-bear
    restart: unless-stopped
    ports:
      - 8080:8080
    environment:
      - TZ=Europe/Paris
    volumes:
      - /etc/localtime:/etc/localtime:ro
```

## Volume mounts

- `/etc/localtime`: This directory is for have the same time as host in the container.

## Environment variables

- `TZ`: To change the timezone of the container set the `TZ` environment variable. The full list of available options can be found on [Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

## Ports

- `8080`: publish glowing-bear on the port 8080 port (eg. http://127.0.0.1:8080)

# License

This project is under the [GNU Generic Public License v3](/LICENSE) to allow free use while ensuring it stays open.
