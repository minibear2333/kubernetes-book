# Dockerfile 最佳实践

根据上次的内容已经足够支撑工作需要来构建镜像了，但是在构建 `Docker` 镜像的过程中，如果注意一些细节，不用花太多时间也可以带来很大的好处。

### 原则与做法

原则上构建一个镜像应该尽可能让其：

* 体积小
* 轻量化

为此应该尽可能做到：

* 尽可能不要让缓存失效，同时要小心使用缓存
* 构建**层数越少越好**，同一个命令，能合并就合并
* 防止重复导入包，对续行的参数按照字母表排序，特别是使用 `apt-get install -y` 安装包的时候。
* 避免垃圾文件，**仅安装**需要的软件包，及时删除多余文件，必要的时候使用 `.dockerignore`，忽略不需要提交构建的文件
* 单一职责，一个容器只做一些事，把不同模块分开

### 缓存原理

`docker` 寻找缓存的逻辑其实就是树型结构根据 `Dockerfile` 指令遍历子节点的过程。下图可以说明这个逻辑。

``` Dockerfile
     FROM base_image:version    Dockerfile:
           +----------+         FROM base_image:version
           |base image|         RUN cmd1  --> use cache because we found base image
           +-----X----+         RUN cmd11 --> use cache because we found cmd1
                / \
               /   \
       RUN cmd1     RUN cmd2    Dockerfile:
       +------+     +------+    FROM base_image:version
       |image1|     |image2|    RUN cmd2  --> use cache because we found base image
       +---X--+     +------+    RUN cmd21 --> not use cache because there's no child node
          / \                   running cmd21, so we build a new image here
         /   \
RUN cmd11     RUN cmd12
+-------+     +-------+
|image11|     |image12|
+-------+     +-------+
```

大部分指令可以根据上述逻辑去寻找缓存，除了 `ADD` 和 `COPY` 。

这两个指令会复制文件内容到镜像内，除了指令相同以外， `docker` 还会**检查每个文件内容校验和**(不包括最后修改时间和最后访问时间)，如果校验和不一致，则不会使用缓存。

### 小心使用缓存

* 除了 `ADD` 和 `COPY` 这两个命令， 其他命令都不会去检查容器内的文件内容，比如 `RUN apt-get -y update` ，每次执行时因为包内容更新，文件可能都不一样，但是 `docker` 会认为命令是一致，继续使用缓存。这样一来，以后构建时都不会再重新运行 `apt-get -y update` 。这种情况下，只有**指令字符串本身**被用来匹配缓存。
* 从`Dockerfile`的第一行开始，每一行都要和已有子镜像的命令完全一样，只要不一样，缓存就失效了。
* 如果 `docker` 没有找到当前指令的缓存，则会构建一个新的镜像，并且之后的所有指令都不会再去找缓存。
* 你也可以通过在 `docker build` 命令中使用 `--no-cache=true` 选项，来放弃使用缓存。

### 构建层数越少越好，同一个命令，能合并就合并（RUN、LABEL）

上面的问题常见的例子就是

``` Dockerfile
...
RUN apt-get -y update
RUN apt-get install -y curl
```

如果要安装新包时，发现 `RUN apt-get -y update` 层完全一样，则命中缓存，不会运行，后面的 `apt-get install` 可能安装的是过时的 `curl` 和 `nginx` 版本。

``` Dockerfile
...
RUN apt-get -y update
RUN apt-get install -y curl nginx
```

这是建议就是合并二者，这些只要安装新包也会更新

``` Dockerfile
RUN apt-get -y update && apt-get install -y curl nginx
```

使用其他命令的时候，也应该尽量合并减少层数

``` Dockerfile
LABEL vendor=ACME\ Incorporated \
      com.example.is-production="" \
      com.example.version="0.0.1-beta" \
      com.example.release-date="2015-02-12"
```

### 防止重复导入包，对续行的参数按照字母表排序

这样子排序，很容易就看出来有没有写重复的地方

``` Dockerfile
RUN apt-get update && apt-get install -y \
    aufs-tools \
    automake \
    build-essential \
    curl \
    dpkg-sig \
    libcap-dev \
    libsqlite3-dev \
    mercurial \
    reprepro \
    ruby1.9.1 \
    ruby1.9.1-dev \
    s3cmd=1.1.*
```

### 避免垃圾文件

仅安装需要的软件包，及时删除多余文件。

还是上面的命令，清理掉 `apt` 缓存 `var/lib/apt/lists` 可以减小镜像大小。因为 `RUN` 指令的开头为 `apt-get udpate` ，包缓存总是会在 `apt-get install` 之前刷新。

``` Dockerfile
RUN apt-get update && apt-get install -y \
    aufs-tools \
    automake \
    build-essential \
    curl \
    dpkg-sig \
    libcap-dev \
    libsqlite3-dev \
    mercurial \
    reprepro \
    ruby1.9.1 \
    ruby1.9.1-dev \
    s3cmd=1.1.* \
 # 其他操作
 && rm -rf /var/lib/apt/lists/*
```

必要的时候使用 `.dockerignore` ，忽略不需要提交构建的文件。比如 `docker` 构建目录下有不想加入上下文的文件或文件夹，不然每次都会加入到上下文，最后打入到镜像里，显得镜像很大。详细介绍回看上一篇。


### 单一职责

每个容器应用只关心一个方面的事情。将多个应用解耦到不同容器中，可以更轻松地保证容器的横向扩展和复用。

例如一个 `web` 应用程序可能包含三个独立的容器： `web` 应用、数据库、缓存，每个容器都是独立的镜像，分开运行。但这并不是说一个容器就只能跑一个进程，因为有的程序可能会自行产生其他进程，

虽然每个容器跑一个进程是一条很好的法则，但这并不是一条硬性的规定。我们主要是希望一个容器只关注一件事情，尽量保持干净和模块化。

### 多阶段构建

多阶段构建可以让我们大幅度减小最终的镜像大小，而不需要去想办法减少中间层和文件的数量。因为镜像是在生成过程的最后阶段生成的，所以可以利用生成缓存来最小化镜像层。

例如，如果你的构建包含多个层，则可以将它们从变化频率较低（以确保生成缓存可重用）到变化频率较高的顺序排序：

* 安装构建应用程序所需的依赖工具
* 安装或更新依赖项
* 构建你的应用

比如我们构建一个 Go 应用程序的 Dockerfile 可能类似于这样：

``` Dockerfile
FROM golang:1.11-alpine AS build

# 安装项目需要的工具
# 运行 `docker build --no-cache .` 来更新依赖
RUN apk add --no-cache git
RUN go get github.com/golang/dep/cmd/dep

# 通过 Gopkg.toml 和 Gopkg.lock 获取项目的依赖
# 仅在更新 Gopkg 文件时才重新构建这些层
COPY Gopkg.lock Gopkg.toml /go/src/project/
WORKDIR /go/src/project/
# 安装依赖库
RUN dep ensure -vendor-only

# 拷贝整个项目进行构建
# 当项目下面有文件变化的时候该层才会重新构建
COPY . /go/src/project/
RUN go build -o /bin/project

# 将打包后的二进制文件拷贝到 scratch 镜像下面，将镜像大小降到最低
FROM scratch
COPY --from=build /bin/project /bin/project
ENTRYPOINT ["/bin/project"]
CMD ["--help"]
```

更多两阶段 `go` 语言项目打包方法 [Golang打镜像Dockerfile的写法](https://coding3min.com/1231.html)
