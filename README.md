# docker-app-logs

git clone https://github.com/nickgryg/docker-app-logs
cd docker-app-logs
vagrant up
vagrant ssh web1 -- docker-compose -f /vagrant/docker/docker-compose.yml up -d rsyslog-agent nginx-app
vagrant ssh web2 -- docker-compose -f /vagrant/docker/docker-compose.yml up -d rsyslog-agent nginx-app
vagrant ssh rsyslogserver -- docker-compose -f /vagrant/docker/docker-compose.yml up -d rsyslog-server mongo

# Checking logs from nginx-app
vagrant ssh rsyslogserver
[vagrant@rsyslogserver ~]$ docker exec -ti docker_mongo_1 bash
root@117cf8cb5ef7:/# mongo
...
> use syslog
switched to db syslog
> db.log.find()
