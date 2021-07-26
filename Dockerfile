FROM node:alpine AS builder

RUN apk add --no-cache --virtual=base --upgrade \
    git && \
    git clone https://github.com/glowing-bear/glowing-bear.git && \
    cd glowing-bear && \
    npm install && \
    npm run build

FROM nginxinc/nginx-unprivileged:latest

LABEL name="docker-weechat" \
      maintainer="Jee jee@jeer.fr" \
      description="WeeChat (Wee Enhanced Environment for Chat) is a free chat client, fast and light, designed for many operating systems." \
      url="https://weechat.org" \
      org.label-schema.vcs-url="https://github.com/jee-r/docker-weechat"

COPY --from=builder /glowing-bear/build/ /usr/share/nginx/html/

EXPOSE 8080

STOPSIGNAL SIGQUIT
