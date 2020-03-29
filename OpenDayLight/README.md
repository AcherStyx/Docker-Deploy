# OpenDayLight

用于构建运行OpenDayLight SDN控制器的Docker镜像。以`bin/karaf`为`ENTRYPOINT`，所以在镜像运行后，ODL控制器会直接启动。  

对于已经启动的OpenDayLight，可以通过`bin/client`来向原本的交互式命名行传递指令。这也是`Dockerfile`中用来安装`feature`的方法。  
通过`Dockerfile`已经安装了部分的关于`sfc`和`l2switch`的功能，需要时自定义这一部分即可。  

## 运行

完整的项目需要具有以下的文件结构：

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
使用`download.sh`会自动下载，但是可能下载会很慢，如有需要建议使用其他下载器手动下载。  

## 效果

在容器构建完开始运行后，在浏览器中输入地址`http://<hostname>:8181/index.html`并以`admin`为用户名和密码登录后，即可进入下列管理界面。  

![odl-web-ui-sfc](_images/odl-web-ui-sfc.png)

OpenDayLight的所有配置文件均建立在容器内，随着容器删除将丢失。  