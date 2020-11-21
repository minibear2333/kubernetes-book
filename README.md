# kubernetes-book

![license](https://img.shields.io/github/license/minibear2333/kubernetes-book.svg) ![issues](https://img.shields.io/github/issues/minibear2333/kubernetes-book.svg) ![stars](https://img.shields.io/github/stars/minibear2333/kubernetes-book.svg) ![forks](https://img.shields.io/github/forks/minibear2333/kubernetes-book.svg)

小熊老师的Docker/Kubernetes(k8s)训练营文档材料

* 如果这个项目能为您带来帮助，我将感到非常荣幸！
* 如果您也对这个项目感兴趣，请点击一下  **<font color="gree">Star</font>** 以示鼓励， 项目会 **持续更新**，谢谢你的支持。
* 如果你发现了项目中的问题，可以提 [issue](https://github.com/minibear2333/kubernetes-book/issues) 和 [pr](https://github.com/minibear2333/kubernetes-book/pulls)
* 你可以使用 gitbook 来 [构建此项目](./tools/gitbook.md) 方便查看，也可以[点此查看电子书](https://k8s.coding3min.com)

> tips: mac 使用 <kbd>command</kbd>+ <kbd>点击链接</kbd> ，windows使用<kbd>ctrl</kbd>+<kbd>点击链接</kbd>的方式可以在新标签打开页面

### Docker课程内容

* 怎么理解容器
* 容器技术的历史进程
* Docker 所使用到的技术是什么？
* Docker 镜像
* Docker 运行时
* Docker 的安装
* Docker 基本操作
* Dockerfile
* 构建Docker私有仓库
* Dockerfile最佳实践

目录
* [Introduction](README.md)
* [容器&Docker入门](Docker.md)
    - [个人简介](me.md)
    - [容器故事](Docker/chapter.1/docker-story.md)
    - [能解决什么问题](Docker/chapter.1/deal-what.md)
    - [优势](Docker/chapter.1/docker-superiority.md)
    - [镜像概念](Docker/chapter.1/what-is-image.md)
    - [容器概念](Docker/chapter.1/what-is-docker.md)
    - [仓库概念](Docker/chapter.1/what-is-repository.md)
* [Docker 安装](Docker.md)
    - [安装说明](Docker/chapter.1/安装Docker.md)
    - [CentOS安装](Docker/chapter.1/Centos安装.md)
    - [Windows安装](Docker/chapter.1/Windows安装.md)
    - [Macbook安装](Docker/chapter.1/Macbook安装.md)
    - [容器&docker入门实验](Docker/chapter.1/README.md)
* [Docker命令](Docker/chapter.2/README.md)
    - [基础命令](Docker/chapter.2/base-command.md)
    - [镜像命令](Docker/chapter.2/image-command.md)
    - [容器操作命令](Docker/chapter.2/container-command.md)
    - [容器管理命令](Docker/chapter.2/container-command2.md)
    - [资源命令](Docker/chapter.2/resources-command.md)
    - [wordpress博客系统](Docker/chapter.2/lab-wordpress.md)
    - [python文件下载系统](Docker/chapter.2/lab-python.md)

### Kubernetes

规划中

### 开源license

本训练营教程使用[apache许可证](./LICENSE)，意思是支持商业用途，但是必须注明引用来源和作者

### 关于我

可以看[我的github首页](https://github.com/minibear2333/)

### blog

机智的程序员小熊 [coding3min.com](https://coding3min.com)

### 公众号

如果你想订阅我的文章，可以微信扫码关注我的公众号【机智的程序员小熊】，我是一个爱思考的程序员，专注于开发、运维、云技术、计算、网络、云存储、数据库、linux等编程知识

![](./images/gzh.jpg)

### 知识星球

如果你想和我交流可以加入我的知识星球，可以微信扫码加入，目前已有100+成员。

* 我会经常分享docker/k8s相关知识
* 也会做做关于工作、职场、技术经验的分享
* 勤奋、踏实、认真、好学是我一定要求自己的人生标准
* 持续输出、终身学习是我一直的践行
* 我每天都会分享哦，星球于2019年10月创建，已经连续分享一年多了。
* 欢迎向我提问，无论是技术还是生活，我会多综合我的工作经验给出有价值的参考
* 每周会发BAT等内推信息（主要是鹅厂），如果你经常刷脸可以帮忙简历直接给hr

<img src="./images/zsxq.jpg" width="400px"></img>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.css">
<script src="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.js"></script>
<div id="gitalk-container"></div>
<script>
var gitalk = new Gitalk({
  "clientID": "c8e0b04455e5b655f885",
  "clientSecret": "579b9c2a1f33e3ef67e7abeb858c562c4b31f37f",
  "repo": "kubernetes-book",
  "owner": "minibear2333",
  "admin": ["minibear2333"],
  "id": location.pathname,      
  "distractionFreeMode": false  
});
gitalk.render("gitalk-container");
</script>