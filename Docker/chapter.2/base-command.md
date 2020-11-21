# 基础命令

针对 `docker` 本身的命令

### 命令速查

|命令	|命令描述|
|:----|:----|
|info	|显示 Docker 详细的系统信息|
|version	|显示docker客户端和服务端版本信息|
|inspect	|查看容器或镜像的配置信息, 默认为json数据|
|events	|实时打印服务端执行的事件|

### 查看docker信息 info命令

https://docs.docker.com/engine/reference/commandline/info/

此命令显示有关Docker安装的系统范围信息。 

``` BASH
docker info
```

* 显示的信息**docker本身的信息**包括内核版本，容器和镜像的数量。 (显示的镜像数量是唯一镜像的数量。以不同名称标记的相同镜像仅计算一次。)
* 根据所使用的**存储驱动程序**，可以显示其他信息，例如池名称，数据文件，元数据文件，使用的数据空间，总数据空间，使用的元数据空间以及总元数据空间。

当容器第一次运行时，Docker会从挂载了 /var/lib/docker 的卷上的可用空间分配一定数量的数据空间和元数据空间。

``` BASH
$ docker info
Containers: 4 # 容器数量
 Running: 0
 Paused: 0
 Stopped: 4
Images: 39   # 镜像数量
Server Version: 18.09.1  # 服务器版本
Storage Driver: overlay2 # 存储驱动程序
 Backing Filesystem: extfs
 Supports d_type: true
 Native Overlay Diff: true
Logging Driver: json-file # 日志驱动程序
Cgroup Driver: cgroupfs # cgroup驱动程序
Plugins: # 插件
 Volume: local
 Network: bridge host macvlan null overlay
 Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
Swarm: inactive # swarm信息
Runtimes: runc # runtimes信息
Default Runtime: runc # 默认runtime
Init Binary: docker-init
containerd version: 9754871865f7fe2f4e74d43e2fc7ccd237edcbce
runc version: 96ec2177ae841256168fcf76954f7177af9446eb
init version: fec3683
Security Options: # 安全选项
 apparmor
 seccomp
  Profile: default
Kernel Version: 4.15.0-38-generic # linux内核版本
Operating System: Linux Mint 18.3 # 操作系统
OSType: linux
Architecture: x86_64
CPUs: 12 # 硬件信息
Total Memory: 15.12GiB
Name: skywork
ID: CICY:F7VQ:DKBG:IEG4:SY75:A6IK:DV52:GIXI:F3P5:VPIM:QMU3:ZXK2
Docker Root Dir: /var/lib/docker # docker根目录
Debug Mode (client): false
Debug Mode (server): false
Registry: https://index.docker.io/v1/ # 镜像仓库
Labels:
Experimental: false
Insecure Registries: # 非安全镜像仓库
 127.0.0.0/8
Registry Mirrors: # 镜像仓库
 https://××××.mirror.aliyuncs.com/
Live Restore Enabled: false
Product License: Community Engine # docker的产品license

WARNING: No swap limit support 
```

### docker info 命令格式化输出

可以通过 `-f` 选项格式化输出，这样可以取这些数据做为监控使用

``` BASH
$ docker info --format '{{json .}}'

{
    "ID":"CICY:F7VQ:DKBG:IEG4:SY75:A6IK:DV52:GIXI:F3P5:VPIM:QMU3:ZXK2",
    "Containers":4,
    "ContainersRunning":0,
    "ContainersPaused":0,
    "ContainersStopped":4,
    "Images":39,
    "Driver":"overlay2",
    "DriverStatus":[
        [
            "Backing Filesystem",
            "extfs"
        ],
        [
            "Supports d_type",
            "true"
        ],
        [
            "Native Overlay Diff",
            "true"
        ]
    ],
    "SystemStatus":null,
    "Plugins":{
        "Volume":[
            "local"
        ],
        "Network":[
            "bridge",
            "host",
            "macvlan",
            "null",
            "overlay"
        ],
        "Authorization":null,
        "Log":[
            "awslogs",
            "fluentd",
            "gcplogs",
            "gelf",
            "journald",
            "json-file",
            "local",
            "logentries",
            "splunk",
            "syslog"
        ]
    },
    "MemoryLimit":true,
    "SwapLimit":false,
    "KernelMemory":true,
    "CpuCfsPeriod":true,
    "CpuCfsQuota":true,
    "CPUShares":true,
    "CPUSet":true,
    "IPv4Forwarding":true,
    "BridgeNfIptables":true,
    "BridgeNfIp6tables":true,
    "Debug":false,
    "NFd":21,
    "OomKillDisable":true,
    "NGoroutines":36,
    "SystemTime":"2019-01-26T21:02:24.681737152+08:00",
    "LoggingDriver":"json-file",
    "CgroupDriver":"cgroupfs",
    "NEventsListener":0,
    "KernelVersion":"4.15.0-38-generic",
    "OperatingSystem":"Linux Mint 18.3",
    "OSType":"linux",
    "Architecture":"x86_64",
    "IndexServerAddress":"https://index.docker.io/v1/",
    "RegistryConfig":{
        "AllowNondistributableArtifactsCIDRs":[

        ],
        "AllowNondistributableArtifactsHostnames":[

        ],
        "InsecureRegistryCIDRs":[
            "127.0.0.0/8"
        ],
        "IndexConfigs":{
            "docker.io":{
                "Name":"docker.io",
                "Mirrors":[
                    "https://****.mirror.aliyuncs.com/"
                ],
                "Secure":true,
                "Official":true
            }
        },
        "Mirrors":[
            "https://****.mirror.aliyuncs.com/"
        ]
    },
    "NCPU":12,
    "MemTotal":16233955328,
    "GenericResources":null,
    "DockerRootDir":"/var/lib/docker",
    "HttpProxy":"",
    "HttpsProxy":"",
    "NoProxy":"",
    "Name":"skywork",
    "Labels":[

    ],
    "ExperimentalBuild":false,
    "ServerVersion":"18.09.1",
    "ClusterStore":"",
    "ClusterAdvertise":"",
    "Runtimes":{
        "runc":{
            "path":"runc"
        }
    },
    "DefaultRuntime":"runc",
    "Swarm":{
        "NodeID":"",
        "NodeAddr":"",
        "LocalNodeState":"inactive",
        "ControlAvailable":false,
        "Error":"",
        "RemoteManagers":null
    },
    "LiveRestoreEnabled":false,
    "Isolation":"",
    "InitBinary":"docker-init",
    "ContainerdCommit":{
        "ID":"9754871865f7fe2f4e74d43e2fc7ccd237edcbce",
        "Expected":"9754871865f7fe2f4e74d43e2fc7ccd237edcbce"
    },
    "RuncCommit":{
        "ID":"96ec2177ae841256168fcf76954f7177af9446eb",
        "Expected":"96ec2177ae841256168fcf76954f7177af9446eb"
    },
    "InitCommit":{
        "ID":"fec3683",
        "Expected":"fec3683"
    },
    "SecurityOptions":[
        "name=apparmor",
        "name=seccomp,profile=default"
    ],
    "ProductLicense":"Community Engine",
    "Warnings":[
        "WARNING: No swap limit support"
    ]
}

```

### 查看版本 version命令

https://docs.docker.com/engine/reference/commandline/version/

查看 docker 版本

``` BASH
$ docker version
```

格式化输出

``` BASH
$ docker version --format '{{json .}}'
```

可以单独获取其中某个数据，如:

``` BASH
$ docker version --format '{{.Server.Version}}'

18.09.1
```

### 查看各资源信息 inspect命令

此命令可以用于镜像、容器、网络、存储
https://docs.docker.com/engine/reference/commandline/inspect/

``` BASH
docker inspect [OPTIONS] NAME|ID [NAME|ID...]
```

比如查看镜像信息

``` BASH
$ docker images
REPOSITORY                                 TAG                                        IMAGE ID            CREATED             SIZE
k8s.gcr.io/kube-proxy                      v1.12.2                                    15e9da1ca195        3 months ago        96.5MB

$ docker inspect 15e9da1ca195
```

查看容器信息

``` BASH
$ docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS               NAMES
81d27abaf849        0d493297b409        "nginx -g 'daemon of…"   2 hours ago         Up 2 hours                              xxx

$ docker inspect 81d27abaf849
```

格式化输出

``` BASH
$ docker inspect --format='{{.Id}}'  15e9da1ca195
sha256:15e9da1ca195086627363bb2e8f5bfca7048345325287d307afd317bab2045b0
$ docker inspect --format='{{.RootFS.Type}}'  15e9da1ca195
layers
```

### 查看docker事件 events命令

https://docs.docker.com/engine/reference/commandline/events/

这里要开两个终端

``` BASH
$ docker events
```

另一个终端运行任何docker命令，然后 `events` 会打印出来执行日志

### 引用

https://skyao.io/learning-docker/command/basic/

### 公众号

如果你想订阅我的文章，可以微信扫码关注我的公众号【机智的程序员小熊】，我是一个爱思考的程序员，专注于开发、运维、云技术、计算、网络、云存储、数据库、linux等编程知识

![](./images/gzh.jpg)
