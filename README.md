# docker-projects
Use docker containers to customize the operating environment of maven, MySQL and Redis. Then apply them together to the online_album project. online_album is a SpringBoot-based web application I developed before. Here I migrate it to a Docker container.

## initialize docker containers with following Dockerfiles
### Dockerfile_maven
```shell
FROM maven:3.6.3-openjdk-8-slim
WORKDIR /
COPY ./static/maven_settings.xml /usr/share/maven/conf/settings.xml
COPY ./static/package.sh package.sh
RUN chmod 744 package.sh
CMD ["/package.sh"]
```
### Dockerfile_mysql
```shell
FROM kiratalent/mysql:5.7
MAINTAINER kroat<1751692446@qq.com>
ENV MYSQL_ROOT_PASSWORD 166414
COPY static/import_sql.sh import_sql.sh
COPY static/springcloud01.sql springcloud01.sql
COPY static/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf
COPY static/change_user_grant.sh change_user_grant.sh
RUN chmod 744 import_sql.sh change_user_grant.sh
CMD service mysql start && ./import_sql.sh && ./change_user_grant.sh && sleep infinity
```
### Dockerfile_redis
```shell
FROM redis:5.0
COPY static/redis5.conf /data/redis.conf
COPY static/start_redis.sh /data/start_redis.sh
RUN chmod 744 start_redis.sh
CMD sh start_redis.sh
```

## send necessary info like host IP and listened port collected by 'docker inspect' to application.yml to configure the spring application
### set_application.sh
```shell
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
```

## configure to compose docker containers
### docker-compose.yml
```yaml
version: "3"
services: 
#maven has already a jdk in it. there is no need to generate a container for jdk 
#    java:
#        build: 
#            context: ./
#            dockerfile: Dockerfile_java
#        container_name: online_album_java_1
#        ports:
#            - "8081:8080"
#        volumes: 
#            - ./public:/public
#        depends_on: 
#            - redis
#            - db
#            - maven
 
    db:
        build: 
            context: ./
            dockerfile: Dockerfile_mysql
        container_name: online_album_db_1

    redis:
        build:
            context: ./
            dockerfile: Dockerfile_redis
        container_name: online_album_redis_1

    maven:
        build: 
            context: ./
            dockerfile: Dockerfile_maven
        container_name: online_album_maven_1
        volumes:
            - ./public:/public
        ports:
            - "8081:8080"
        depends_on: 
            - db
            - redis
```
