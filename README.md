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
