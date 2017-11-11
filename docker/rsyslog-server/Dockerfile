FROM alpine:3.6 

MAINTAINER Nickolay Grygoriev <nickgryg@gmail.com>

RUN apk add --no-cache rsyslog

COPY configs/rsyslog.conf /etc/rsyslog.conf

EXPOSE 514/tcp 514/udp

ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]
