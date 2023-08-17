#!/bin/bash

p="." 

dbUser='root'

dbPassword='166414'

cd $p;

for f in `ls $p/*.sql`

do

echo $f;

#mysql -u$dbUser -p$dbPassword -e "source $f";
mysql -u$dbUser -p$dbPassword -h 'localhost' -e "source $f";

mv $f $f.done;

done

echo 'sql import finished'

#mysql -u$dbUser -p$dbPassword -e "create user 'root'@'%' identified by '$dbPassword'; grant all on *.* to 'root'@'%'; flush privileges;";
mysql -u$dbUser -p$dbPassword -h 'localhost' -e "create user 'root'@'%' identified by '$dbPassword'; grant all on *.* to 'root'@'%'; flush privileges;";

echo 'grant finished'
