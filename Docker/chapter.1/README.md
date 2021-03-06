# 容器实验

### 课件

* <a target="_blank" href="./容器&docker入门.pptx">容器&docker入门.pptx</a>
* <a target="_blank" href="./容器&docker入门.pdf">容器&docker入门.pdf</a>

  

### lab 1

输出 hello world 

依次执行下面命令完成实验

``` BASH
docker pull hello-world
docker run hello-world
```

输出内容如下则成功

``` BASH
Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
 
```

### lab 2

``` BASH
docker run -d -p 80:80 --name webserver nginx
```

然后访问浏览器，如下成功

![](images/runnginx.png)

### 公众号

如果你想订阅我的文章，可以微信扫码关注我的公众号【机智的程序员小熊】，我是一个爱思考的程序员，专注于开发、运维、云技术、计算、网络、云存储、数据库、linux等编程知识

![](./images/gzh.jpg)
