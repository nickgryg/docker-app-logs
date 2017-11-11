#!/bin/bash -x

docker run -d -p 5000:5000 --restart=always --name registry registry:2

for i in $(ls -1 /vagrant/docker)
do 
	docker build -t registry:5000/$i /vagrant/docker/$i && \
	docker push registry:5000/$i 
done
