# Dockerfile 其他建议

### FROM

尽可能的使用官方镜像，如果追求镜像的大小，可以考虑 `alpine` （一般小于10 MB）同时仍是完整的 Linux 发行版。

也可以考虑 `scratch` ，就是一个空镜像。

### LABEL、RUN

已经说过了，见上一篇

### 不要用ADD高级用法，而要使用管道

为了让镜像尽量小，最好不要使用 ADD 指令从远程 URL 获取包，而是使用 curl 和 wget。这样你可以在文件提取完之后删掉不再需要的文件来避免在镜像中额外添加一层。比如尽量避免下面的用法：

``` Dockerfile
ADD http://example.com/big.tar.xz /usr/src/things/
RUN tar -xJf /usr/src/things/big.tar.xz -C /usr/src/things
RUN make -C /usr/src/things all
```

而是应该使用下面这种方法：

``` Dockerfile
RUN mkdir -p /usr/src/things \
    && curl -SL http://example.com/big.tar.xz \
    | tar -xJC /usr/src/things \
    && make -C /usr/src/things all
```

上面使用的管道操作，所以没有中间文件需要删除。对于其他不需要 ADD 的自动提取功能的文件或目录，你应该使用 COPY。

### 注意管道

带管带的命令，其返回值是最后一条命令的返回值。所以如果管道前的命令出错而管道后的指令正常执行，则docker不会认为这条指令有问题。如果需要所有的管道命令都正常执行，可以增加set -o pipefail，如：

``` Dockerfile
RUN set -o pipefail && wget -O - https://some.site | wc -l > /number
```

部分shell不支持set -o pipefail，所以需要指定shell。如：

``` Dockerfile
RUN ["/bin/bash", "-c", "set -o pipefail && wget -O - https://some.site | wc -l > /number"]
```

### ENTRYPOINT

ENTRYPOINT指令的主要用途是把容器当做命令来用，此时CMD指令来指定默认参数。可以自己写脚本来当做ENTRYPOINT。

### VOLUME

强烈建议使用该指令为用户数据创建数据卷，如数据的存储位置、配置文件的存储位置或用户自己创建的文件/目录等。

### USER

如果镜像的服务不用授权就能使用，那应该新增用户和组，以新用户来执行，如：

``` Dockerfile
RUN groupadd -r postgres && useradd -r -g postgres postgres
```

需要注意的是，UID/GID是顺着镜像中已存在的UID/GID创建的，如果对这个有严格要求，应该自己显式定义UID/GID。
不要在镜像内安装或使用sudo，如果需要类似的功能，可以使用gosu。
也不要来来回回的切换用户，这样会增加图层层数。

### 公众号

如果你想订阅我的文章，可以微信扫码关注我的公众号【机智的程序员小熊】，我是一个爱思考的程序员，专注于开发、运维、云技术、计算、网络、云存储、数据库、linux等编程知识

![](./images/gzh.jpg)
