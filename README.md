Horde Groupware
==============
Updated Fork of [zauberertz/horde](https://git.ziegler.bz/docker/horde) to work with Ubuntu 16.04 and php7.

### With local Database via Socket-Share
```
docker run --name ts_horde -d \
-v /path/to/horde/storage:/etc/horde \
-v /var/run/mysqld/mysqld.sock:/var/run/mysqld/mysqld.sock \
-p [YOURPORT]:80 \
-e HORDE_TEST_DISABLE=true 
-e HTTP_X_FORWARDED_FOR=webmail.domain.tld \
-e HTTP_X_FORWARDED_PROTO=webmail.domain.tld \
-e DB_PASS=[dbpassword] \
boredland/horde-docker
```
### With direct port share:
```docker run -d --link mysql:mysql -v /path/to/horde/storage:/etc/horde -p 80:80 boredland/horde-docker```

### With jwilder/nginx-proxy as example for local testing
```
docker run -d \
--link mysql:mysql \
-v /path/to/horde/storage:/etc/horde \
-e VIRTUAL_HOST=~^horde\..*\.xip\.io \
-e HORDE_TEST_DISABLE=false \
boredland/horde-docker
```
Set HTTP_X_FORWARDED_FOR to the Romote address of the server
Set HTTP_X_FORWARDED_PROTO for HTTPS
```
### DB default values or link a mysql
```
DB default values or link a mysql
DB_HOST localhost
DB_PORT 3306
DB_NAME horde
DB_USER horde
DB_PASS horde
DB_DRIVER mysqli
```
### Enable test.php of horde by setting this to false
```HORDE_TEST_DISABLE true```

Openssl and GNU PGP both unter ```/usr/bin/``` 