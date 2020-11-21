# 资源命令

|命令|	命令描述|
|:----|:----|
|stats|	显示容器硬件资源使用情况|
|update|	更新容器的硬件资源限制|
|system|	管理系统资源|

### 容器使用资源stats

查看单个容器使用情况
https://docs.docker.com/engine/reference/commandline/stats/

``` BASH
$ docker stats 1ddf7b4a0433
CONTAINER ID        NAME                                                                   CPU %               MEM USAGE / LIMIT   MEM %               NET I/O             BLOCK I/O           PIDS
1ddf7b4a0433        k8s_ct-busybox_pod1_default_dc02beb6-d2b9-4bb0-baf0-d794daff2f8c_292   0.00%               416KiB / 1.944GiB   0.02%               0B / 0B             123kB / 0B          1
```

查看全部容器使用情况，很消耗资源

``` BASH
$ docker stats
CONTAINER ID        NAME                                                                                         CPU %               MEM USAGE / LIMIT     MEM %               NET I/O             BLOCK I/O           PIDS
1ddf7b4a0433        k8s_ct-busybox_pod1_default_dc02beb6-d2b9-4bb0-baf0-d794daff2f8c_292                         0.00%               416KiB / 1.944GiB     0.02%               0B / 0B             123kB / 0B          1
81d27abaf849        k8s_nginx_nginx-deployment-64b7b5bd84-p65mg_default_37027a37-9a73-4c0f-af51-361eb4092e51_5   0.00%               1.875MiB / 1.944GiB   0.09%               0B / 0B             3.65MB / 0B         2
4a7159497938        k8s_nginx_nginx-deployment-64b7b5bd84-vqhfj_default_544809e8-ca8c-4316-ba63-55528259b429_5   0.00%               1.941MiB / 1.944GiB   0.10%               0B / 0B             2.5MB / 0B          2
```

### system命令

用法：

``` BASH
docker system COMMAND
```

四个参数

* `df`：docker磁盘使用率
* `events`：和docker events用法一样
* `info`：和docker infos一样
* `prune`：删除没有在使用的资源，谨慎使用

https://docs.docker.com/engine/reference/commandline/system/

``` BASH
docker system df
docker system df -v
docker system events
docker system info
docker system prune
```

### 公众号

如果你想订阅我的文章，可以微信扫码关注我的公众号【机智的程序员小熊】，我是一个爱思考的程序员，专注于开发、运维、云技术、计算、网络、云存储、数据库、linux等编程知识

![](./images/gzh.jpg)
