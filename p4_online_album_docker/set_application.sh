#!/bin/bash


DB_USERNAME=$1
DB_PASSWORD=$2
while [ -z $(docker ps | grep online_album_db_1) ]
do
        echo 'db initializing, waiting...'
        sleep 1s
done
DB_HOST=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' online_album_db_1)

DB_PORT=$3
DB_IN_USE=$4

while [ -z $(docker ps | grep online_album_redis_1) ]
do
        echo 'redis initializing, waiting...'
        sleep 1s
done
REDIS_HOST=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' online_album_redis_1)

cd ./public/online_album_by_springboot

sed -i "s/{db_username}/${DB_USERNAME}/g" ./src/main/resources/application.yml
sed -i "s/{db_password}/${DB_PASSWORD}/g" ./src/main/resources/application.yml
sed -i "s/{db_host}/${DB_HOST}/g" ./src/main/resources/application.yml
sed -i "s/{db_port}/${DB_PORT}/g" ./src/main/resources/application.yml
sed -i "s/{db_in_use}/${DB_IN_USE}/g" ./src/main/resources/application.yml
sed -i "s/{redis_host}/${REDIS_HOST}/g" ./src/main/resources/application.yml
echo 'set application finished!'
echo 'set application finished!'
echo 'set application finished!'
echo 'set application finished!'
echo 'set application finished!'
echo 'set application finished!'
echo 'set application finished!'
touch ../signal
