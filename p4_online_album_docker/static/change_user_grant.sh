#!/bin/bash
p="."
dbUser='root'
dbPassword='166414'

cd $p;

#mysql -u$dbUser -p$dbPassword -e "create user 'root'@'%' identified by '$dbPassword';grant all on *.* to 'root'@'%';flush privileges;";
#solve: 127.0.0.1 not allowed to connect to mysql-server
mysql -u$dbUser -h 'localhost' -p$dbPassword -e "create user 'root'@'%' identified by '$dbPassword';grant all on *.* to 'root'@'%';flush privileges;";

echo 'finished!'
