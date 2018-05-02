#!/bin/bash

#要备份的IP、用户名密码、数据库
ip=127.0.0.1
username=root
userpass=
#可备份多个数据库
dblist=(
mysql
)

bakdir=./bak`date "+%Y%m%d%H%M%S"`
if [ ! -d $bakdir ]; then
	mkdir $bakdir
fi

for v in ${dblist[@]}
do  
	echo '正在备份:'$v
	dbfile=$bakdir'/'$v'.sql'
	mysqldump -h $ip -u $username -p$userpass $v > $dbfile
	
	echo -e '已备份['$ip']的['$v']数据库' >> $bakdir'/bak.log'
done
