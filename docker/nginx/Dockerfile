FROM alpine:3.6

MAINTAINER Nickolay Grygoriev <nickgryg@gmail.com>

RUN apk add --no-cache nginx && mkdir -p /var/www/html

COPY configs/nginx.conf /etc/nginx/nginx.conf
COPY configs/default.conf /etc/nginx/conf.d/

EXPOSE 80

STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
