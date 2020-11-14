# CentOS安装

### 系统要求

Docker 支持以下的 64 位 CentOS 版本：

* CentOS 7
* CentOS 8
* 更高版本...

### 使用官方安装脚本自动安装

安装命令如下：

``` BASH
curl -fsSL https://get.docker.com | bash -s docker --mirror Aliyun
```

也可以使用国内 daocloud 一键安装命令：

``` BASH
curl -sSL https://get.daocloud.io/docker | sh
```

### 手动安装-卸载旧版本

旧版本的docker叫做docker或者docker-engine ，如果有安装，先卸载其以及其依赖，新版本的docker叫做docker-ce。

`/var/lib/docker/` 目录下的镜像文件，容器，卷和网络将会被保留，不会被删除。

``` BASH
sudo yum remove docker \
        docker-client \
        docker-client-latest \
        docker-common \
        docker-latest \
        docker-latest-logrotate \
        docker-logrotate \
        docker-engine
```

### 安装

有三种安装办法：

* 在软件源内添加docker，并且安装，这样安装和升级比较方便，官方推荐。
* 下载RPM包手动安装，手动升级，一般在与互联网隔绝的情况下使用此方法。
* 官方一键安装脚本，上面说过，此处不再赘述。

### 使用仓库安装

**设置仓库**

``` BASH
$ sudo yum install -y yum-utils

$ sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
```

**安装Docker引擎**

安装最近版本，如果要安装指定版本参考 <a target="_blank" href="https://coding3min.com/1227.html">更新docker的yum源</a>

``` BASH
$ sudo yum install docker-ce docker-ce-cli containerd.io
```

**启动docker CE**

启动其实是启动 docker deamon，即docker守护进程/docker引擎

``` BASH
$ sudo systemctl start docker
```

以上即是CentOS从仓库中安装docker CE的全部过程，如果需要升级的话，移除之前的docker，再重复上面的过程即可。

ps: 其他安装方法参考[官网](https://docs.docker.com/engine/install/centos/)

ps: 更新国内镜像源参考 <a target="_blank" href="https://coding3min.com/1229.html">更改docker的镜像源地址</a>

### 参考

[官网](https://docs.docker.com/engine/install/centos/)
[CentOS Docker 安装](https://www.runoob.com/docker/centos-docker-install.html)
[史上最全（全平台）docker安装方法！](https://zhuanlan.zhihu.com/p/54147784)

### 公众号

如果你想订阅我的文章，可以微信扫码关注我的公众号【机智的程序员小熊】，我是一个爱思考的程序员，专注于开发、运维、云技术、计算、网络、云存储、数据库、linux等编程知识

![](./images/gzh.jpg)
