#!/bin/bash

sed -i 's/SELINUX=enforcing/SELINUX=permissive/g' /etc/selinux/config
setenforce 0

mv /tmp/daemon.json /etc/docker/

systemctl daemon-reload
systemctl restart docker
