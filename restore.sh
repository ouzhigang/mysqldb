#!/bin/bash

#要备份的IP、用户名密码、数据库
ip=127.0.0.1
username=root
userpass=
restoredir=bak20180502142535

if [ ! -d ./$restoredir ]; then
	echo -e '找不到备份目录'
	exit
fi

backuplist=`ls ./$restoredir | grep \.sql`
for v in $backuplist
do
	dbname=${v//\.sql/''}
	mysql -h$ip -u$username -p$userpass $dbname < ./$restoredir/$v
done
