#!/bin/sh
set -x
set -e
cd $(dirname $0)

myuser=isucon
mydb=isu4_qualifier
myhost=127.0.0.1
myport=3306
mysql -h ${myhost} -P ${myport} -u ${myuser} -pisucon -e "DROP DATABASE IF EXISTS ${mydb}; CREATE DATABASE ${mydb}"
mysql -h ${myhost} -P ${myport} -u ${myuser} -pisucon ${mydb} < sql/schema.sql
mysql -h ${myhost} -P ${myport} -u ${myuser} -pisucon ${mydb} < sql/dummy_users.sql
mysql -h ${myhost} -P ${myport} -u ${myuser} -pisucon ${mydb} < sql/dummy_log.sql
