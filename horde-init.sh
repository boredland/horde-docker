#!/bin/bash

if [[ ! -f "/etc/horde/horde/conf.php" ]]; then
    cp -rp /etc/.horde/* /etc/horde/
    cp /etc/horde/horde/conf.php.dist /etc/horde/horde/conf.php
    cat /etc/horde-base-settings.inc >> /etc/horde/horde/conf.php
fi

if [[ $MYSQL_PORT_3306_TCP_ADDR ]]; then
    sed -i "s/^\(.*sql.*hostspec.*=\)\(.*\);/\1 '$MYSQL_PORT_3306_TCP_ADDR';/g" /etc/horde/horde/conf.php
    sed -i "s/^\(.*sql.*port.*=\)\(.*\);/\1 '$MYSQL_PORT_3306_TCP_PORT';/g" /etc/horde/horde/conf.php
else
	sed -i "s/^\(.*sql.*hostspec.*=\)\(.*\);/\1 '$DB_HOST';/g" /etc/horde/horde/conf.php
	sed -i "s/^\(.*sql.*port.*=\)\(.*\);/\1 '$DB_PORT';/g" /etc/horde/horde/conf.php
fi

sed -i "s/^\(.*sql.*username.*=\)\(.*\);/\1 '$DB_USER';/g" /etc/horde/horde/conf.php
sed -i "s/^\(.*sql.*password.*=\)\(.*\);/\1 '$DB_PASS';/g" /etc/horde/horde/conf.php
sed -i "s/^\(.*sql.*database.*=\)\(.*\);/\1 '$DB_NAME';/g" /etc/horde/horde/conf.php