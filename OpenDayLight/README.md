# OpenDayLight


<!-- @import "[TOC]" {cmd="toc" depthFrom=2 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [运行OpenDayLight](#运行opendaylight)
  - [运行效果](#运行效果)
  - [向karaf会话传递指令](#向karaf会话传递指令)
- [配置SFC demo](#配置sfc-demo)
  - [地址分配](#地址分配)

<!-- /code_chunk_output -->

用于构建运行OpenDayLight SDN控制器的Docker镜像。以`bin/karaf`为`ENTRYPOINT`，所以在镜像运行后，ODL控制器会直接启动。  

## 运行OpenDayLight

启用OpenDayLight需要具有以下的文件结构：

```
./
├── docker-compose.yml
├── Dockerfile
├── README.md
└── source
    ├── download.sh
    ├── jdk-8u241-linux-x64.tar.gz *
    └── karaf-0.8.4.tar.gz *
```

以上带“*”的文件需要自行下载后放在对应位置，所有文件均就绪之后运行`docker-compose up --build`即可自动部署。  

>  :pill: 使用`download.sh`会自动下载，但是可能下载会很慢，如有需要建议使用其他下载器手动下载。  

### 运行效果

在容器构建完开始运行后，在浏览器中输入地址`http://<hostname>:8181/index.html`并以`admin`为用户名和密码登录后，即可进入下列管理界面。  

![odl-web-ui-sfc](_images/odl-web-ui-sfc.png)

OpenDayLight的所有配置文件均建立在容器内，随着容器删除将丢失。  

### 向karaf会话传递指令

对于已经启动的OpenDayLight，可以通过`bin/client`来向原本的交互式命名行传递指令。[^from-shell-command]
这也是`Dockerfile`中用来安装`feature`的方法：通过`Dockerfile`已经安装了部分的关于`sfc`和`l2switch`的功能，需要时自定义这一部分即可。  

`client`命令的使用如下所示，其中参数`-r 20`表示了连接失败的重试次数。  

```shell
client -r 20 "feature:instal [feature1] [feature2] ..."
```

## 配置SFC demo

默认实现了启动OpenDayLight的同时，还启动了一系列用于构建SFC demo的容器。

> :pill: 如果不需要这一部分直接在`docker-compose.yml`注释掉相关镜像即可。  

这一部分的文件结构如下：

```
.
`-- sfc\ demo
    |-- sf
    |   |-- Dockerfile
    |   `-- source 
    |       |-- download.sh
    |       `-- ... *
    `-- sff
        `-- Dockerfile
```

其中缺少的可执行文件通过`download.sh`下载。  

### 地址分配

在`docker-compose.yml`中为这一组镜像创建了指定的网络，并进行了IP地址的固定分配，各个部分的IP地址如下：  

| App | IPv4 Address |
|---|---|
| OpenDayLight | 10.0.0.10 |
| SF1 | 10.0.0.11 |

[^from-shell-command]: [scripting - Script Karaf shell commands? - Stack Overflow](https://stackoverflow.com/questions/26434360/script-karaf-shell-commands)