``` BASH
docker  run  [OPTIONS]  IMAGE  [COMMAND]  [ARG...]
```

* `-d` : 后台运行容器，并返回容器ID
* `-i`：以交互模式运行容器，通常与 -t 同时使用
* `-t`：为容器重新分配一个伪输入终端，通常与 -i 同时使用
* `-v`：绑定挂载目录
* `--name="mycontainer"`: 为容器指定一个名称
* `--net="bridge"`: 指定容器的网络连接类型，支持 `bridge`、`host`、`none`
* `-p/-P` : 端口映射

![](images/docker-port.jpg)

1. 容器控制

``` BASH
启动/重启容器：docker start/restart CONTAINER

停止/强停容器：docker stop/ kill CONTAINER

删除容器：docker rm [OPTIONS] CONTAINER [CONTAINER...]

重命名容器：docker rename CONTAINER CONTAINER_NEW

进入容器：docker attach CONTAINER

执行容器命令：docker exec CONTAINER COMMAND

查看容器日志：docker logs [OPTIONS] CONTAINER

查看容器列表：docker ps [OPTIONS]
```
