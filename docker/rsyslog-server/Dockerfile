FROM debian:jessie

MAINTAINER Nickolay Grygoriev <nickgryg@gmail.com>

RUN apt-get update && apt-get install -y --no-install-recommends rsyslog rsyslog-mongodb

COPY configs/rsyslog.conf /etc/rsyslog.conf
COPY configs/mongodb.conf /etc/rsyslog.d/mongodb.conf

EXPOSE 514/tcp 514/udp

ENTRYPOINT ["rsyslogd", "-n", "-f", "/etc/rsyslog.conf"]
