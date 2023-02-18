# docker-glowing-bear

[![Docker Image Size (latest by date)](https://img.shields.io/docker/image-size/j33r/glowing-bear?style=flat-square)](https://microbadger.com/images/j33r/glowing-bear)
![GitHub Workflow Status (branch)](https://img.shields.io/github/actions/workflow/status/jee-r/docker-glowing-bear/deploy.yaml?branch=main&style=flat-square)
[![DockerHub](https://img.shields.io/badge/Dockerhub-j33r/glowing%2D-bear-%232496ED?logo=docker&style=flat-square)](https://hub.docker.com/r/j33r/glowing-bear)
[![ghcr.io](https://img.shields.io/badge/ghrc%2Eio-jee%2D-r/glowing%2D-bear-%232496ED?logo=github&style=flat-square)](https://ghcr.io/jee-r/glowing-bear)


A docker image for [glowing-bear](https://github.com/glowing-bear/glowing-bear) ![glowing-bear logo](https://raw.githubusercontent.com/glowing-bear/glowing-bear/master/src/assets/img/favicon.png)


## What is glowing-bear ?

From [github.com/glowing-bear/glowing-bear](https://github.com/glowing-bear/glowing-bear):

> Glowing Bear is a web frontend for the WeeChat IRC client and strives to be a modern interface. It relies on WeeChat to do all the heavy lifting and then provides some nice features on top of that, like embedding images, videos, and other content. The best part, however, is that you can use it from any modern internet device -- whether it's a computer, tablet, or smart phone -- and all your stuff is there, wherever you are. You don't have to deal with the messy technical details, and all you need to have installed is a browser or our app.

- Source Code : https://github.com/glowing-bear/glowing-bear
- Official Website : https://glowing-bear.org

## How to use these images

All the lines commented in the examples below should be adapted to your environment. 

Note: this image is based on latest [nginxinc/nginx-unprivileged](https://github.com/nginxinc/docker-nginx-unprivileged) 

### With Docker

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

### With Docker Compose

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

### Volume mounts

- `/etc/localtime`: This directory is for have the same time as host in the container.

### Environment variables

- `TZ`: To change the timezone of the container set the `TZ` environment variable. The full list of available options can be found on [Wikipedia](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).

### Ports

- `8080`: publish glowing-bear on the port 8080 port (eg. http://127.0.0.1:8080)


### Issues

Found any issue or bug in the codebase? Have a great idea you want to propose ? 
You can help by submitting an issue to the Github repository. 

**Before opening a new issue, please check if the issue has not been already made by searching 
the issues**

### Questions

We would like to have discussions and general queries related to this repository.
you can reach me on [Libera irc server](https://libera.chat/) `/query jee`

### Pull requests

Before submitting a pull request, ensure that you go through the following:

- Ensure that there is no open or closed Pull Request corresponding to your submission to avoid duplication of effort.
- Create a new branch on your forked repo based on the **main branch** and make the changes in it. Example:

```
    git clone https://your_fork
    git checkout -B patch-N main
```

- Submit the pull request, provide informations (why/where/how) in the comments section


## License

This project is under the [GNU Generic Public License v3](/LICENSE) to allow free use while ensuring it stays open.
