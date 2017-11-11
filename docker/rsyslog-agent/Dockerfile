FROM alpine:3.6 

MAINTAINER Nickolay Grygoriev <nickgryg@gmail.com>

RUN apk add --no-cache rsyslog

COPY configs/rsyslogd.conf /etc/rsyslog.conf
COPY configs/forward2server.conf /etc/rsyslog.d/
COPY scripts/docker-entrypoint.sh /docker-entrypoint.sh

EXPOSE 514/tcp 514/udp

ENTRYPOINT ["/docker-entrypoint.sh"]
