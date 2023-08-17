# docker-projects
Use docker containers to customize the operating environment of maven, MySQL and Redis. Then apply them together to the online_album project. online_album is a SpringBoot-based web application I developed before. Here I migrate it to a Docker container.

## initialize docker containers with following Dockerfiles
`shell
FROM maven:3.6.3-openjdk-8-slim

WORKDIR /

COPY ./static/maven_settings.xml /usr/share/maven/conf/settings.xml
COPY ./static/package.sh package.sh

RUN chmod 744 package.sh

CMD ["/package.sh"]
`
