# wordpress 实验

实验目标：使用 `Docker` 命令搭建 `wordpress` 博客网站

* 创建1个共享网络
* 创建 `mysql` 和 `wordpress` 的随机存储
* 启动容器

### 创建网络

* `docker network create wordpress`
* `docker network list`

### 创建存储

* `docker volume create mysql`
* `docker volume create wordpress`
* `docker volume list`

### 下载wordpress镜像

* `docker image pull wordpress:4.9.6`
* `docker image inspect wordpress:4.9.6`

### 下载mysql镜像

* `docker image pull mysql:5.7`
* `docker image inspect mysql:5.7`

### 启动 MySql

``` BASH
docker run --name wordpressdb -d --rm \
--net wordpress \
-v mysql:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=pass@word \
-e MYSQL_DATABASE=wordpress \
mysql:5.7
```

### 启动 Wordpress

``` BASH
docker run --name wordpress -d --rm \

--net wordpress -p 8090:80 --link wordpressdb:mysql \
-e WORDPRESS_DB_PASSWORD=pass@word \
wordpress:4.9.6
```

### 检查

* `http://localhost:8090` through a browser

### 公众号

如果你想订阅我的文章，可以微信扫码关注我的公众号【机智的程序员小熊】，我是一个爱思考的程序员，专注于开发、运维、云技术、计算、网络、云存储、数据库、linux等编程知识

![](./images/gzh.jpg)
