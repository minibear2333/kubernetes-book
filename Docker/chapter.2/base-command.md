``` BASH
查看docker信息：docker info

docker命令帮助：docker run --help

复制文件到容器：docker cp custom.conf Nginx:/etc/nginx/conf.d/

更新容器启动项：docker container update --restart=always nginx

查看docker日志：tail -f /var/log/messages
```
