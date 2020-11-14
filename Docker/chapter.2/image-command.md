# 镜像命令

### 命令速查

|命令|	命令描述|
|:----|:----|
|images|	查看本地镜像（列出本地所有镜像）|
|inspect|	查看镜像详情|
|search|	查找镜像|
|tag|	修改镜像tag|
|history|	显示镜像每层的变更内容|
|rmi|	删除本地镜像|
|pull|	获取镜像|
|push|	推送镜像到仓库|
|login|	登录第三方仓库|
|logout|	退出第三方仓库|
|save|	打包本地镜像, 使用压缩包来完成迁移|
|load|	导入镜像压缩包|
|commit|	将容器保存为镜像|
|build|	使用Dockerfile构建镜像|
|import|	导入本地容器快照文件为镜像|

### 查看所有镜像 images命令

默认的docker images 命令将显示所有顶级镜像，其存储库和标签，以及它们的大小。

``` BASH
docker  images  [OPTIONS]  [REPOSITORY[:TAG]]
```

SIZE是镜像及其所有父镜像占用的累积空间。 这也是Docker save命令制作镜像时创建的Tar文件内容使用的磁盘空间。

``` BASH
$ docker images
REPOSITORY                              TAG                                              IMAGE ID            CREATED             SIZE
minibear2333/nginx                      hello                                            089ad90ddb16        8 days ago          133MB
```

过滤查询

``` BASH
$ docker images istio/pilot
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
istio/pilot         0.7.1               6223c9364df7        10 months ago       51.9MB

$ docker images istio/*
REPOSITORY                               TAG                 IMAGE ID            CREATED             SIZE
istio/mixer                              0.7.1               251b0d3d2b93        10 months ago       54MB
istio/pilot         0.7.1               6223c9364df7        10 months ago       51.9MB
...
```

还有一种 `--filter` 的方式来查询不同状态，往往可以用 `grep` 来代替，有兴趣自行[官网](https://docs.docker.com/engine/reference/commandline/images/)学习

### 搜索镜像

``` BASH
docker  search  [OPTIONS]  TERM
```

https://docs.docker.com/engine/reference/commandline/search/

当前支持的过滤器有：

`is-official` 是否官方

``` BASH
$ docker search busybox -f "is-official=true"
NAME                DESCRIPTION           STARS               OFFICIAL            AUTOMATED
busybox             Busybox base image.   2035                [OK]
```

`is-automated` 是否自动生成

``` BASH
$ docker search --filter is-automated=true busybox

NAME                 DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
progrium/busybox                                                     50                   [OK]
radial/busyboxplus   Full-chain, Internet enabled, busybox made...   8                    [OK]
```

`star` 数，意思是至少有多少个 `star` 数

``` BASH
$ docker search --filter stars=3 busybox

NAME                 DESCRIPTION                                     STARS     OFFICIAL   AUTOMATED
busybox              Busybox base image.                             325       [OK]
progrium/busybox                                                     50                   [OK]
radial/busyboxplus   Full-chain, Internet enabled, busybox made...   8                    [OK]
```

### 镜像标签

https://docs.docker.com/engine/reference/commandline/tag/

``` BASH
docker  tag  SOURCE_IMAGE[:TAG]  TARGET_IMAGE[:TAG]
```

``` BASH
docker tag xxxx abc:1.0
```

当前也可以重命名

``` BASH
docker tag minibear2333/gitbook-export:0.0.1 minibear2333/gitbook:latest
```

### 镜像历史变更

显示镜像的历史，显示镜像每层的变更内容

https://docs.docker.com/engine/reference/commandline/history/

``` BASH
docker history [OPTIONS] IMAGE
```

如果加 `--no-trunc` 参数会打印出全部的内部

``` BASH
$ docker history minibear2333/gitbook-export:latest
IMAGE               CREATED             CREATED BY                                      SIZE                COMMENT
852e99c1aba1        13 days ago         CMD ["/bin/sh" "-c" "mv /genbook.sh . && chm…   0B                  buildkit.dockerfile.v0
<missing>           13 days ago         WORKDIR /home                                   0B                  buildkit.dockerfile.v0
<missing>           13 days ago         MAINTAINER minibear2333 "coding3min@foxmail.…   0B                  buildkit.dockerfile.v0
<missing>           13 days ago         bash                                            21.4MB              
.......
/bin/sh -c #(nop)  CMD ["/bin/bash"]            0B
<missing>           3 months ago        /bin/sh -c #(nop)  LABEL org.label-schema.sc…   0B
<missing>           3 months ago        /bin/sh -c #(nop) ADD file:538afc0c5c964ce0d…   215MB
```

### 删除镜像

https://docs.docker.com/engine/reference/commandline/rmi/

直接加镜像id就行

``` BASH
docker  rmi [OPTIONS]  IMAGE  [IMAGE...]
```

### 上传镜像

``` BASH
docker  push  [OPTIONS]  NAME[:TAG]
```

### 下载镜像

``` BASH
docker  pull  [OPTIONS]  NAME[:TAG]
```

### 提交镜像

``` BASH
docker  commit [OPTIONS]  CONTAINER  NAME[:TAG]
```

### 构建镜像

``` BASH
docker  build  [OPTIONS]  PATH
```

### 公众号

如果你想订阅我的文章，可以微信扫码关注我的公众号【机智的程序员小熊】，我是一个爱思考的程序员，专注于开发、运维、云技术、计算、网络、云存储、数据库、linux等编程知识

![](./images/gzh.jpg)
