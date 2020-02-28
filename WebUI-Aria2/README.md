# WebUI Aria2 Docker部署


<!-- @import "[TOC]" {cmd="toc" depthFrom=2 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [功能点/修改](#功能点修改)
- [设置](#设置)
  - [安全性设置](#安全性设置)
  - [文件设置](#文件设置)

<!-- /code_chunk_output -->

这一份代码基于原本的[Aria2-WebUI](https://github.com/ziahamza/webui-aria2)项目创建而来，在原本的基础上按需做了一些修改。

## 功能点/修改

- 将`aria2.conf`直接导入到容器内部，可直接按需替换为自己的配置。
- 内置了`aria2.session`以保存下载会话。
- `WebUI-Aria2`的相关前端页面文件通过`git`下载。
- 对镜像内部原本的文件路径、用户做了一定的改动。

## 设置

### 安全性设置

以下条目需要进行修改以保证安全性：  

- `aria2.conf`中的`rpc-secret`：对应WebUI设置中使用的`token`，以对接入者身份进行验证。  

### 文件设置

需要的话，对下载文件的保存目录进行修改，位于`docker-compose.yml`中：  

```yml
services:
  webui-aria2:
    ...
    volumes:
      # set the download directory
      - /data/Downloads:/data
```
