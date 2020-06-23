# Docker部署脚本

用于部署各种服务的Docker脚本（主要是指docker-compose）。  

## 应用/服务列表

- ### [Nextcloud](https://github.com/AcherStyx/Docker-Deploy/tree/master/Nextcloud)

    [Nextcloud官网](https://nextcloud.com/)
    补全了大部分额外配置内容：Nginx、Redis、Cron、SSL加密。

- ### [Netdata](https://github.com/AcherStyx/Docker-Deploy/tree/master/Netdata)

    Netdata本身是一个Web形式的本地性能监控，可以配合Netdata Cloud使用在线账户统一监控所有主机的运行状态，即使没有内网穿透。  

- ### [WebUI Aria2](https://github.com/AcherStyx/Docker-Deploy/tree/master/WebUI-Aria2)

    Aria2的网页客户端，详见来源项目：[Aria2-WebUI](https://github.com/ziahamza/webui-aria2)  

- ### [PostgreSQL](https://github.com/AcherStyx/Docker-Deploy/tree/master/PostgreSQL)

    Postgre数据库，主要用于数据库的动手练习。  

- ### [OpenDayLight](https://github.com/AcherStyx/Docker-Deploy/tree/master/OpenDayLight)

    用于在`Docker`中部署运行OpenDayLight SDN控制器，默认使用`0.8.4`版本。  

## 一些说明

### 关于运行

大部分都是直接通过`docker-compose`实现的，并且需要一些配置。  
详细配置参加各个应用下的README。  

### 权限

由于没有对目录的权限进行配置，在使用额外的挂载目录的时候，务必保证对目录有读写权限，比如`\data`目录下的读写权限，这是大部分脚本的默认外挂储存目录。  

```shell
sudo chmod 777 -R /data
```

发生这种情况的时候，使用`docker logs app-name`通常会看到`Permission denied`错误提示。  

### 数据

- `\data`：数据文件主要的挂载位置，用于数据的持久化。再进一步的文件夹划分类似于`\data\app-name\`或`\data\project\app-name`。  
- Docker Volume。
