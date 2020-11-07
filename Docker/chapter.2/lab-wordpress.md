# wordpress 实验

实验目标：使用 `Docker` 命令搭建 `wordpress` 博客网站

In order to deploy a *wordpress* application, we should:

* create 1 network
* create 2 volumes
  * 1 for mysql
  * 1 for wordpress
* launch the *mysql* container
* launch the *wordpress* container

### Network Creation

* `docker network create wordpress`
* `docker network list`

### Volume Creation

* `docker volume create mysql`
* `docker volume create wordpress`
* `docker volume list`

### WordPress Image Download

* `docker image pull wordpress:4.9.6`
* `docker image inspect wordpress:4.9.6`

### MySql Image Download

* `docker image pull mysql:5.7`
* `docker image inspect mysql:5.7`

### Launch the Container MySql

``` BASH
docker run --name wordpressdb -d --rm \
--net wordpress \
-v mysql:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=P@ssw0rd \
-e MYSQL_DATABASE=wordpress \
mysql:5.7
```

### Launch the Container Wordpress

``` BASH
docker run --name wordpress -d --rm \

--net wordpress -p 8090:80 --link wordpressdb:mysql \
-e WORDPRESS_DB_PASSWORD=P@ssw0rd \
wordpress:4.9.6
```

### Check

* `http://localhost:8090` through a browser
