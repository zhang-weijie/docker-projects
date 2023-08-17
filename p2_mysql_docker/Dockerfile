FROM kiratalent/mysql:5.7
MAINTAINER kroat<1751692446@qq.com>

ENV MYSQL_ROOT_PASSWORD 166414

COPY static/import_sql.sh import_sql.sh
COPY static/springcloud01.sql springcloud01.sql
COPY static/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf

CMD service mysql start && ./import_sql.sh && sleep infinity
