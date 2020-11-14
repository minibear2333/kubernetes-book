# docker镜像定制 Dockfile

![](images/dockerfile.png)

实际上 `docker` 镜像是可以被定制的，我们从 `docker` 底层了解到，每个镜像都是以一个 `base` 镜像为基础，进行定制。

从第一节课我们知道，镜像是一层一层进行构建而出，而定制的过程也正是不断的一层一层的增加，添加配置、文件等信息。

### 镜像定制的方式

镜像定制的方式有两种

* 运行docker镜像，在容器中进行文件的增加和命令的修改，然后使用 `docker commit` 提交当前镜像完成定制
* 使用 `Dockerfile` 的文本文件来进行镜像定制，我们可以把镜像的每一层修改、安装、构建、操作的命令都写入到这个文件中，一行就对应镜像的一层

`docker commit` 的方式没有办法记录详细的定制进程，所以不够直观，而 `Dockerfile` 的方式更方便更直观，还可以提交到版本库进行管理

### docker commit

`docker commit` 能不用就不用，但是有时候工作忙是常事，暂时使用这种方式可以节省很多时间。

``` BASH
docker commit [选项] <容器ID或容器名> [<仓库名>[:<标签>]]
```

运行nginx

``` BASH
$ docker run -d -p 80:80 nginx:stable-alpine
59e066b0a3af3dacf0e8af84d8ce351d512e270739a6e5c6ae7cc839cbbd9ef4
```

修改容器内部

``` BASH
$ docker exec -it 59e066b0a3af3dacf0e8af84d8ce351d512e270739a6e5c6ae7cc839cbbd9ef4 sh
/ # echo hello minibear2333 > /usr/share/nginx/html/index.html
/ # exit

$ docker diff 59e066b0a3af3dacf0e8af84d8ce351d512e270739a6e5c6ae7cc839cbbd9ef4
C /var
C /var/cache
C /var/cache/nginx
A /var/cache/nginx/scgi_temp
A /var/cache/nginx/uwsgi_temp
A /var/cache/nginx/client_temp
A /var/cache/nginx/fastcgi_temp
A /var/cache/nginx/proxy_temp
C /etc
C /etc/nginx
C /etc/nginx/conf.d
C /etc/nginx/conf.d/default.conf
C /root
A /root/.ash_history
C /usr
C /usr/share
C /usr/share/nginx
C /usr/share/nginx/html
C /usr/share/nginx/html/index.html
C /run
A /run/nginx.pid
```

提交容器

``` BASH
docker commit -a "minibear2333" -m "change index.html" 59e066b0a3af3dacf0e8af84d8ce351d512e270739a6e5c6ae7cc839cbbd9ef4 minibear2333/nginx:commit-stable-alpine
```

* `-a`的全称是`--author`，当前提交的作者名
* `-m`的全称是`--message`，修改信息，类似于`git commit -m "xxx"`

测试

``` BASH
docker images
```

### Dockerfile


