# Docker部署脚本

用于部署各种服务的Docker脚本（主要是指docker-compose）。  

## 应用/服务列表

- ### [WebUI Aria2](https://github.com/AcherStyx/Docker-Deploy/tree/master/WebUI-Aria2)

    Aria2的网页客户端，详见来源项目：[Aria2-WebUI](https://github.com/ziahamza/webui-aria2)  

- ### [PostgreSQL](https://github.com/AcherStyx/Docker-Deploy/tree/master/PostgreSQL)

    Postgre数据库，主要用于数据库的动手练习。  

## 一些说明

### 关于运行

默认都是尽量做到以对应文件夹为根目录，使用`docker-compose up`即可完成部署，少数由于技术原因难以实现的除外。  

### 版本

对于部分应用提供了额外的可选版本，以类似`docker-compose.version.yml`的形式命名。  

### 权限

由于没有对目录的权限进行配置，在使用额外的挂载目录的时候，务必保证对目录有读写权限，比如`\data`目录下的读写权限，这是大部分脚本的默认外挂储存目录。  
发生这种情况的时候，使用`docker logs app-name`通常会看到`Permission denied`错误提示。  

### 文件安排

- `\data`：数据文件主要的挂载位置，用于数据的持久化。再进一步的文件夹划分类似于`\data\app-name\`。  
