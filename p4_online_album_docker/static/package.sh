#!/bin/bash

cd ./public
while [ -z $(ls ./ | grep signal) ]
do
	echo 'container maven waiting for container db and container redis to be initialized...'
	sleep 2s
done

cd ./online_album_by_springboot
mvn package -Dmaven.test.skip=true
echo 'package finished!'
java -jar ./target/online_album_by_springboot-0.0.1-SNAPSHOT.jar 
