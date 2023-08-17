#!/bin/bash
p="." 
dbUser='root'
dbPassword='166414'

cd $p;

for f in `ls $p/*.sql`
do
echo $f;
#mysql -u$dbUser -p$dbPassword -e "source $f";
#solve: 127.0.0.1 not allowed to connect to mysql-server
mysql -u$dbUser -h 'localhost' -p$dbPassword -e "source $f";
mv $f $f.done;
done

echo 'finished!'
