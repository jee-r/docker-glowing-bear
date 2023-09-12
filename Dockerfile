FROM node:lts-alpine3.18 AS builder

RUN apk add --no-cache --virtual=base --upgrade \
      git && \
    git clone https://github.com/glowing-bear/glowing-bear.git && \
    cd glowing-bear && \
    npm install && \
    npm run build 

FROM nginxinc/nginx-unprivileged:latest

LABEL name="docker-glowing-bear" \
      maintainer="Jee jee@jeer.fr" \
      description="A web client for WeeChat" \
      url="https://www.glowing-bear.org/" \
      org.label-schema.vcs-url="https://github.com/jee-r/docker-glowing-bear" \
      org.opencontainers.image.source="https://github.com/jee-r/docker-glowing-bear"

COPY --from=builder /glowing-bear/build/ /usr/share/nginx/html/

EXPOSE 8080

STOPSIGNAL SIGQUIT
