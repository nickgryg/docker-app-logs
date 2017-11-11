#!/bin/sh

sed -i "s/LOG_SERVER/$LOG_SERVER/g" /etc/rsyslog.d/forward2server.conf

rsyslogd -n -f /etc/rsyslog.conf
