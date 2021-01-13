- [效率](#效率)
  - [自动补全](#自动补全)
  - [不想写那么长的命令](#不想写那么长的命令)
  - [每次都要打命名空间，太累了？](#每次都要打命名空间太累了)
- [操作资源](#操作资源)
  - [创建对象](#创建对象)
  - [你在哪，我的资源？](#你在哪我的资源)
  - [更新资源](#更新资源)
  - [修补资源](#修补资源)
  - [编辑资源](#编辑资源)
  - [删除资源](#删除资源)
- [调试](#调试)
  - [这些好用的工具，你怎么能没有？](#这些好用的工具你怎么能没有)
  - [日志你在哪！](#日志你在哪)
  - [监控](#监控)
  - [资源限制](#资源限制)
  - [执行命令](#执行命令)
  - [格式化输出](#格式化输出)
  - [Kubectl 详细输出和调试](#kubectl-详细输出和调试)
  - [集群](#集群)
  - [来回传文件](#来回传文件)
- [网络](#网络)
  - [修改Pod内部的/etc/hosts](#修改pod内部的etchosts)
  - [为什么我Ping不通svc？可以让我直接访问你吗](#为什么我ping不通svc可以让我直接访问你吗)
- [生命周期](#生命周期)
  - [pod你别跑！](#pod你别跑)
  - [等等，你有事没做完！](#等等你有事没做完)
- [伸缩](#伸缩)
  - [改副本数量（Scale 资源）](#改副本数量scale-资源)
  - [服务你别断（滚动更新）](#服务你别断滚动更新)
  - [回滚与跳转任意版本](#回滚与跳转任意版本)
- [其他](#其他)
  - [跨集群](#跨集群)

## 效率

### 自动补全

``` BASH
source <(kubectl completion bash) # setup autocomplete in bash, bash-completion package should be installed first.
```

``` BASH
source <(kubectl completion zsh)  # setup autocomplete in zsh
```

### 不想写那么长的命令

1、设置别名
``` BASH
$ alias k=kubectl
$ k get po
NAME    READY   STATUS    RESTARTS   AGE
mypod   1/1     Running   18         43h
```

2、使用缩写

下表列出的是 kubernetes 中所有支持的类型和缩写的别名。

| 资源类型                       | 缩写别名     |
| -------------------------- | -------- |
| `clusters` |          |
| `componentstatuses` | `cs` |
| `configmaps` | `cm` |
| `daemonsets` | `ds` |
| `deployments` | `deploy` |
| `endpoints` | `ep` |
| `event` | `ev` |
| `horizontalpodautoscalers` | `hpa` |
| `ingresses` | `ing` |
| `jobs` |          |
| `limitranges` | `limits` |
| `namespaces` | `ns` |
| `networkpolicies` |          |
| `nodes` | `no` |
| `statefulsets` |          |
| `persistentvolumeclaims` | `pvc` |
| `persistentvolumes` | `pv` |
| `pods` | `po` |
| `podsecuritypolicies` | `psp` |
| `podtemplates` |          |
| `replicasets` | `rs` |
| `replicationcontrollers` | `rc` |
| `resourcequotas` | `quota` |
| `cronjob` |          |
| `secrets` |          |
| `serviceaccount` | `sa` |
| `services` | `svc` |
| `storageclasses` |          |
| `thirdpartyresources` |          |

记不住，用这个来查

``` BASH
kubectl api-resources
```

``` BASH
NAME                              SHORTNAMES   APIGROUP                       NAMESPACED   KIND
bindings                                                                      true         Binding
componentstatuses                 cs                                          false        ComponentStatus
configmaps                        cm                                          true         ConfigMap
endpoints                         ep                                          true         Endpoints
events                            ev                                          true         Event
limitranges                       limits                                      true         LimitRange
namespaces                        ns                                          false        Namespace
nodes                             no                                          false        Node
persistentvolumeclaims            pvc                                         true         PersistentVolumeClaim
persistentvolumes                 pv                                          false        PersistentVolume
pods                              po                                          true         Pod
podtemplates                                                                  true         PodTemplate
replicationcontrollers            rc                                          true         ReplicationController
resourcequotas                    quota                                       true         ResourceQuota
secrets                                                                       true         Secret
serviceaccounts                   sa                                          true         ServiceAccount
services                          svc                                         true         Service
mutatingwebhookconfigurations                  admissionregistration.k8s.io   false        MutatingWebhookConfiguration
validatingwebhookconfigurations                admissionregistration.k8s.io   false        ValidatingWebhookConfiguration
customresourcedefinitions         crd,crds     apiextensions.k8s.io           false        CustomResourceDefinition
apiservices                                    apiregistration.k8s.io         false        APIService
controllerrevisions                            apps                           true         ControllerRevision
daemonsets                        ds           apps                           true         DaemonSet
deployments                       deploy       apps                           true         Deployment
replicasets                       rs           apps                           true         ReplicaSet
statefulsets                      sts          apps                           true         StatefulSet
tokenreviews                                   authentication.k8s.io          false        TokenReview
localsubjectaccessreviews                      authorization.k8s.io           true         LocalSubjectAccessReview
selfsubjectaccessreviews                       authorization.k8s.io           false        SelfSubjectAccessReview
selfsubjectrulesreviews                        authorization.k8s.io           false        SelfSubjectRulesReview
subjectaccessreviews                           authorization.k8s.io           false        SubjectAccessReview
horizontalpodautoscalers          hpa          autoscaling                    true         HorizontalPodAutoscaler
cronjobs                          cj           batch                          true         CronJob
jobs                                           batch                          true         Job
certificatesigningrequests        csr          certificates.k8s.io            false        CertificateSigningRequest
leases                                         coordination.k8s.io            true         Lease
events                            ev           events.k8s.io                  true         Event
daemonsets                        ds           extensions                     true         DaemonSet
deployments                       deploy       extensions                     true         Deployment
ingresses                         ing          extensions                     true         Ingress
networkpolicies                   netpol       extensions                     true         NetworkPolicy
podsecuritypolicies               psp          extensions                     false        PodSecurityPolicy
replicasets                       rs           extensions                     true         ReplicaSet
networkpolicies                   netpol       networking.k8s.io              true         NetworkPolicy
poddisruptionbudgets              pdb          policy                         true         PodDisruptionBudget
podsecuritypolicies               psp          policy                         false        PodSecurityPolicy
clusterrolebindings                            rbac.authorization.k8s.io      false        ClusterRoleBinding
clusterroles                                   rbac.authorization.k8s.io      false        ClusterRole
rolebindings                                   rbac.authorization.k8s.io      true         RoleBinding
roles                                          rbac.authorization.k8s.io      true         Role
priorityclasses                   pc           scheduling.k8s.io              false        PriorityClass
storageclasses                    sc           storage.k8s.io                 false        StorageClass
volumeattachments                              storage.k8s.io                 false        VolumeAttachment
```



### 每次都要打命名空间，太累了？

``` BASH
kubectl get namespace
kubectl config set contexts.my-context.namespace my-namespace
```


## 操作资源

### 创建对象

``` BASH
$ kubectl create -f ./my-manifest.yaml           # 创建资源
$ kubectl create -f ./my1.yaml -f ./my2.yaml     # 使用多个文件创建资源
$ kubectl create -f ./dir                        # 使用目录下的所有清单文件来创建资源
$ kubectl create -f https://git.io/vPieo         # 使用 url 来创建资源
$ kubectl run nginx --image=nginx                # 启动一个 nginx 实例
$ kubectl explain pods,svc                       # 获取 pod 和 svc 的文档

# 从 stdin 输入中创建多个 YAML 对象
$ cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Pod
metadata:
  name: busybox-sleep
spec:
  containers:

  + name: busybox

    image: busybox
    args:

    - sleep
    - "1000000"

---
apiVersion: v1
kind: Pod
metadata:
  name: busybox-sleep-less
spec:
  containers:

  + name: busybox

    image: busybox
    args:

    - sleep
    - "1000"

EOF

# 创建包含几个 key 的 Secret
$ cat <<EOF | kubectl create -f -
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  password: $(echo "s33msi4" | base64)
  username: $(echo "jane" | base64)
EOF
```

### 你在哪，我的资源？

``` BASH
# Get commands with basic output
$ kubectl get services                          # 列出所有 namespace 中的所有 service
$ kubectl get pods --all-namespaces             # 列出所有 namespace 中的所有 pod
$ kubectl get pods -o wide                      # 列出所有 pod 并显示详细信息
$ kubectl get deployment my-dep                 # 列出指定 deployment
$ kubectl get pods --include-uninitialized      # 列出该 namespace 中的所有 pod 包括未初始化的

# 使用详细输出来描述命令
$ kubectl describe nodes my-node
$ kubectl describe pods my-pod

$ kubectl get services --sort-by=.metadata.name # List Services Sorted by Name

# 根据重启次数排序列出 pod
$ kubectl get pods --sort-by='.status.containerStatuses[0].restartCount'

# 获取所有具有 app=cassandra 的 pod 中的 version 标签
$ kubectl get pods --selector=app=cassandra rc -o \
  jsonpath='{.items[*].metadata.labels.version}'

# 获取所有节点的 ExternalIP
$ kubectl get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="ExternalIP")].address}'

# 列出属于某个 PC 的 Pod 的名字
# “jq”命令用于转换复杂的 jsonpath，参考 https://stedolan.github.io/jq/
$ sel=${$(kubectl get rc my-rc --output=json | jq -j '.spec.selector | to_entries | .[] | "\(.key)=\(.value),"')%?}
$ echo $(kubectl get pods --selector=$sel --output=jsonpath={.items..metadata.name})

# 查看哪些节点已就绪
$ JSONPATH='{range .items[*]}{@.metadata.name}:{range @.status.conditions[*]}{@.type}={@.status};{end}{end}' \
 && kubectl get nodes -o jsonpath="$JSONPATH" | grep "Ready=True"

# 列出当前 Pod 中使用的 Secret
$ kubectl get pods -o json | jq '.items[].spec.containers[].env[]?.valueFrom.secretKeyRef.name' | grep -v null | sort | uniq
```

### 更新资源

``` BASH
$ kubectl rolling-update frontend-v1 -f frontend-v2.json           # 滚动更新 pod frontend-v1
$ kubectl rolling-update frontend-v1 frontend-v2 --image=image:v2  # 更新资源名称并更新镜像
$ kubectl rolling-update frontend --image=image:v2                 # 更新 frontend pod 中的镜像
$ kubectl rolling-update frontend-v1 frontend-v2 --rollback        # 退出已存在的进行中的滚动更新
$ cat pod.json | kubectl replace -f -                              # 基于 stdin 输入的 JSON 替换 pod

# 强制替换，删除后重新创建资源。会导致服务中断。
$ kubectl replace --force -f ./pod.json

# 为 nginx RC 创建服务，启用本地 80 端口连接到容器上的 8000 端口
$ kubectl expose rc nginx --port=80 --target-port=8000

# 更新单容器 pod 的镜像版本（tag）到 v4
$ kubectl get pod mypod -o yaml | sed 's/\(image: myimage\):.*$/\1:v4/' | kubectl replace -f -

$ kubectl label pods my-pod new-label=awesome                      # 添加标签
$ kubectl annotate pods my-pod icon-url=http://goo.gl/XXBTWq       # 添加注解
$ kubectl autoscale deployment foo --min=2 --max=10                # 自动扩展 deployment “foo”
```

### 修补资源

使用策略合并补丁并修补资源。

``` BASH
$ kubectl patch node k8s-node-1 -p '{"spec":{"unschedulable":true}}' # 部分更新节点

# 更新容器镜像； spec.containers[*].name 是必须的，因为这是合并的关键字
$ kubectl patch pod valid-pod -p '{"spec":{"containers":[{"name":"kubernetes-serve-hostname","image":"new image"}]}}'

# 使用具有位置数组的 json 补丁更新容器镜像
$ kubectl patch pod valid-pod --type='json' -p='[{"op": "replace", "path": "/spec/containers/0/image", "value":"new image"}]'

# 使用具有位置数组的 json 补丁禁用 deployment 的 livenessProbe
$ kubectl patch deployment valid-deployment  --type json   -p='[{"op": "remove", "path": "/spec/template/spec/containers/0/livenessProbe"}]'

```

### 编辑资源

在编辑器中编辑任何 API 资源。

``` BASH
$ kubectl edit svc/docker-registry                      # 编辑名为 docker-registry 的 service
$ KUBE_EDITOR="nano" kubectl edit svc/docker-registry   # 使用其它编辑器

```

### 删除资源

``` BASH
$ kubectl delete -f ./pod.json                                              # 删除 pod.json 文件中定义的类型和名称的 pod
$ kubectl delete pod,service baz foo                                        # 删除名为“baz”的 pod 和名为“foo”的 service
$ kubectl delete pods,services -l name=myLabel                              # 删除具有 name=myLabel 标签的 pod 和 serivce
$ kubectl delete pods,services -l name=myLabel --include-uninitialized      # 删除具有 name=myLabel 标签的 pod 和 service，包括尚未初始化的
$ kubectl -n my-ns delete po,svc --all                                      # 删除 my-ns namespace 下的所有 pod 和 serivce，包括尚未初始化的
```

``` BASH
kubectl scale deployment $deployName --replicas=0 [-n $nameSpaceName]
```

批量删除
``` BASH
kubectl -n monitor get pods |grep prometheus | awk '{print $1}' |xargs -i kubectl -n monitor delete pod {}
kubectl -n monitor delete pod xx1 xx2 xx3
```


## 调试

### 这些好用的工具，你怎么能没有？

临时挂载宿主机上的命令

### 日志你在哪！

``` BASH
$ kubectl logs my-pod                                 # dump 输出 pod 的日志（stdout）
$ kubectl logs my-pod -c my-container                 # dump 输出 pod 中容器的日志（stdout，pod 中有多个容器的情况下使用）
$ kubectl logs -f my-pod                              # 流式输出 pod 的日志（stdout）
$ kubectl logs -f my-pod -c my-container              # 流式输出 pod 中容器的日志（stdout，pod 中有多个容器的情况下使用）
```

### 监控

可以是pod和node

``` BASH
$ kubectl top pod POD_NAME --containers               # 显示指定 pod 和容器的指标度量
```

``` BASH
km top po --containers
POD                                      NAME                    CPU(cores)   MEMORY(bytes)   
alertmanager-db86555bf-qjjcl             alertmanager            3m           30Mi            
grafana-5d85b68ff7-9kmnr                 grafana                 1m           41Mi            
prometheus-0                      prometheus       137m         1036Mi          
```

``` BASH
kubectl top node
NAME           CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%   
k8s-master01   1712m        10%    38212Mi         59%       
k8s-master02   1378m        8%     39356Mi         61%       
k8s-master03   2191m        13%    16503Mi         25%       
```

### 资源限制

``` BASH
apiVersion: v1  
kind: LimitRange  
metadata:  
name: mem-limit-range  
spec:  
limits:  
- default:  
   memory: 512Mi  
 defaultRequest:  
   memory: 256Mi  
 type: Container
```



### 执行命令

``` BASH
$ kubectl exec my-pod -- ls /                         # 在已存在的容器中执行命令（只有一个容器的情况下）
$ kubectl exec my-pod -c my-container -- ls /         # 在已存在的容器中执行命令（pod 中有多个容器的情况下）
```

### 格式化输出

``` BASH
km get pod alertmanager-db86555bf-qjjcl -o wide
NAME                           READY   STATUS    RESTARTS   AGE   IP           NODE           NOMINATED NODE   READINESS GATES
alertmanager-db86555bf-qjjcl   1/1     Running   0          15d   9.130.1.28   k8s-master02   <none>           <none>
```

要以特定的格式向终端窗口输出详细信息，可以在 `kubectl` 命令中添加 `-o` 或者 `-output` 标志。

| 输出格式                                | 描述                                       |
| ----------------------------------- | ---------------------------------------- |
| `-o=custom-columns=<spec>` | 使用逗号分隔的自定义列列表打印表格                        |
| `-o=custom-columns-file=<filename>` | 使用 文件中的自定义列模板打印表格                        |
| `-o=json` | 输出 JSON 格式的 API 对象                       |
| `-o=jsonpath=<template>` | 打印 [jsonpath](https://kubernetes.io/docs/user-guide/jsonpath) 表达式中定义的字段 |
| `-o=jsonpath-file=<filename>` | 打印由 文件中的 [jsonpath](https://kubernetes.io/docs/user-guide/jsonpath) 表达式定义的字段 |
| `-o=name` | 仅打印资源名称                                  |
| `-o=wide` | 以纯文本格式输出任何附加信息，对于 Pod ，包含节点名称            |
| `-o=yaml` | 输出 YAML 格式的 API 对象                       |

### Kubectl 详细输出和调试

使用 `-v` 或 `--v` 标志跟着一个整数来指定日志级别。

| 详细等级    | 描述                                       |
| ------- | ---------------------------------------- |
| `--v=0` | 总是对操作人员可见。                               |
| `--v=1` | 合理的默认日志级别，如果您不需要详细输出。                    |
| `--v=2` | 可能与系统的重大变化相关的，有关稳定状态的信息和重要的日志信息。这是对大多数系统推荐的日志级别。 |
| `--v=3` | 有关更改的扩展信息。                               |
| `--v=4` | 调试级别详细输出。                                |
| `--v=6` | 显示请求的资源。                                 |
| `--v=7` | 显示HTTP请求的header。                         |
| `--v=8` | 显示HTTP请求的内容。                             |

### 集群

``` BASH
$ kubectl cordon my-node                                                # 标记 my-node 不可调度
$ kubectl drain my-node                                                 # 清空 my-node 以待维护
$ kubectl uncordon my-node                                              # 标记 my-node 可调度
$ kubectl top node my-node                                              # 显示 my-node 的指标度量
$ kubectl cluster-info                                                  # 显示 master 和服务的地址
$ kubectl cluster-info dump                                             # 将当前集群状态输出到 stdout                                    
$ kubectl cluster-info dump --output-directory=/path/to/cluster-state   # 将当前集群状态输出到 /path/to/cluster-state

# 如果该键和影响的污点（taint）已存在，则使用指定的值替换
$ kubectl taint nodes foo dedicated=special-user:NoSchedule
```

### 来回传文件

``` BASH
kubectl cp <file-spec-src> <file-spec-dest>
kubectl cp <file-spec-src> <file-spec-dest> -c <specific-container>
```

``` BASH
kubectl cp /tmp/foo <some-namespace>/<some-pod>:/tmp/bar
kubectl cp <some-namespace>/<some-pod>:/tmp/foo /tmp/bar
```



## 网络

### 修改Pod内部的/etc/hosts

HostAliases：定义了 Pod 的 hosts 文件（比如 /etc/hosts）里的内容

``` yaml
apiVersion: v1
kind: Pod
...
spec:
  hostAliases:

  + ip: "10.1.2.3"

    hostnames:

    - "foo.remote"
    - "bar.remote"

...
```

在 Kubernetes 项目中，如果要设置 hosts 文件里的内容，一定要通过这种方法。否则，如果直接修改了 hosts 文件的话，在 Pod 被删除重建之后，kubelet 会自动覆盖掉被修改的内容。

### 为什么我Ping不通svc？可以让我直接访问你吗

方法一：

``` BASH
# 右边pod内，左边宿主机
kubectl port-forward redis-master-765d459796-258hz 7000:6379
kubectl port-forward pods/redis-master-765d459796-258hz 7000:6379 --address=10.1.1.1
kubectl port-forward replicaset/redis-master 7000:6379
kubectl port-forward service/redis-master 7000:redis
```

输出

``` BASH
Forwarding from 127.0.0.1:7000 -> 6379
Forwarding from [::1]:7000 -> 6379
```

随机

``` BASH
kubectl port-forward deployment/redis-master :6379
```

输出

``` BASH
Forwarding from 127.0.0.1:62162 -> 6379
Forwarding from [::1]:62162 -> 6379
```

方法二：
还有一种临时暴露方式是expose，这种相当于多建了一个svc

``` BASH
kubectl expose svc/prometheus --type=NodePort --name=prom-np --port=9090
```

## 生命周期

### pod你别跑！

NodeSelector

Pod和Node进程绑定

``` yaml
apiVersion: v1
kind: Pod
...
spec:
 nodeSelector:
   disktype: ssd
```

这样的一个配置，意味着这个 Pod 永远只能运行在携带了“disktype: ssd”标签（Label）的节点上；否则，它将调度失败。

### 等等，你有事没做完！

lifecycle 容器启停前后执行命令

``` yaml
apiVersion: v1
kind: Pod
metadata:
  name: lifecycle-demo
spec:
  containers:

  + name: lifecycle-demo-container

    image: nginx
    lifecycle:
      postStart:
        exec:
          command: ["/bin/sh", "-c", "echo Hello from the postStart handler > /usr/share/message"]
      preStop:
        exec:
          command: ["/usr/sbin/nginx","-s","quit"]
```

* postStart ：在容器启动后，立刻执行一个指定的操作。需要明确的是，postStart 定义的操作，虽然是在 Docker 容器 ENTRYPOINT 执行之后，但它并不严格保证顺序。也就是说，在 postStart 启动时，ENTRYPOINT 有可能还没有结束。

当然，如果 postStart 执行超时或者错误，Kubernetes 会在该 Pod 的 Events 中报出该容器启动失败的错误信息，导致 Pod 也处于失败的状态。

* preStop： 发生的时机，则是容器被杀死之前（比如，收到了 SIGKILL 信号）。而需要明确的是，preStop 操作的执行，是同步的。所以，它会阻塞当前的容器杀死流程，直到这个 Hook 定义操作完成之后，才允许容器被杀死，这跟 postStart 不一样。

## 伸缩

### 改副本数量（Scale 资源）

``` BASH
$ kubectl scale --replicas=3 rs/foo                                 # Scale a replicaset named 'foo' to 3
$ kubectl scale --replicas=3 -f foo.yaml                            # Scale a resource specified in "foo.yaml" to 3
$ kubectl scale --current-replicas=2 --replicas=3 deployment/mysql  # If the deployment named mysql's current size is 2, scale mysql to 3
$ kubectl scale --replicas=5 rc/foo rc/bar rc/baz                   # Scale multiple replication controllers

```

### 服务你别断（滚动更新）

### 回滚与跳转任意版本

``` BASH
kubectl rollout history deploy prometheus -n monitor
```

``` BASH
REVISION  CHANGE-CAUSE
1         <none>
2         <none>
3         <none>
4         <none>
5         <none>
6         <none>
7         <none>
8         <none>
9         <none>
10        <none>
11        <none>
12        <none>
13        <none>
14        <none>
15        <none>
16        <none>
17        <none>
18        <none>
19        <none>
20        <none>
21        <none>
22        <none>
23        <none>
24        <none>
25        <none>
26        <none>
27        <none>
```

查看版本3的情况

``` BASH
kubectl rollout history deploy prometheus -n monitor --revision 3
deployment.extensions/prometheus with revision #3
Pod Template:
  Labels:       app=prometheus
        heritage=Tiller
        pod-template-hash=cb47699f
        release=monitor
  Containers:
   prometheus:
    Image:      registry.tstack.com:5000/monitor/prometheus:1.0.0.0.b1e07c6
    Port:       <none>
    Host Port:  <none>
    Environment:        <none>
    Mounts:
      /etc/localtime from host-time (rw)
      /etc/prometheus/appconfig.json from app-config (rw,path="appconfig.json")
  Volumes:
   host-time:
    Type:       HostPath (bare host directory volume)
    Path:       /etc/localtime
    HostPathType:
   app-config:
    Type:       ConfigMap (a volume populated by a ConfigMap)
    Name:       prometheus-config
    Optional:   false

```

https://cloud.google.com/kubernetes-engine/docs/how-to/updating-apps?hl=zh-cn



## 其他

### 跨集群
