# 容器管理命令

### docker命令帮助 --help

可以对任何命令使用 `--help` 来获取提示

``` BASH
docker run --help
```

### 复制文件到容器

``` BASH
docker cp custom.conf Nginx:/etc/nginx/conf.d/
```

### 更新容器启动项

``` BASH
docker container update --restart=always nginx
```

### 查看docker日志(docker服务的日志)

``` BASH
tail -f /var/log/messages
```

### 公众号

如果你想订阅我的文章，可以微信扫码关注我的公众号【机智的程序员小熊】，我是一个爱思考的程序员，专注于开发、运维、云技术、计算、网络、云存储、数据库、linux等编程知识

![](./images/gzh.jpg)
