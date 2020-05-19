# DIR = /Users/yzhao/Desktop/mydata
docker run -p 3307:3306 --name mysql-master \
-v /Users/yzhao/Desktop/mydata/mysql-master/log:/var/log/mysql \
-v /Users/yzhao/Desktop/mydata/mysql-master/data:/var/lib/mysql \
-v /Users/yzhao/Desktop/mydata/mysql-master/conf:/etc/mysql \
-e MYSQL_ROOT_PASSWORD=root  \
--network mysql-network \
-d mysql:5.7

docker run -p 3308:3306 --name mysql-slave \
-v /Users/yzhao/Desktop/mydata/mysql-slave/log:/var/log/mysql \
-v /Users/yzhao/Desktop/mydata/mysql-slave/data:/var/lib/mysql \
-v /Users/yzhao/Desktop/mydata/mysql-slave/conf:/etc/mysql \
-e MYSQL_ROOT_PASSWORD=root  \
--network mysql-network \
-d mysql:5.7

# change master to master_host='172.18.0.2', master_user='slave', master_password='123456', master_port=3307, master_log_file='repl-demo-mysql-bin.000001', master_log_pos=617, master_connect_retry=30;  