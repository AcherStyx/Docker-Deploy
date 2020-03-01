# PostgreSQL Docker部署


<!-- @import "[TOC]" {cmd="toc" depthFrom=2 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [修改](#修改)
- [设置](#设置)
  - [用户](#用户)
  - [安全性](#安全性)
  - [储存](#储存)

<!-- /code_chunk_output -->

用于做PostgreSQL数据库的基本部署。由于暂且没有什么额外的需求，所以之进行了基本的配置，如果你有什么建议可以通过创建Issue来告诉我。  

## 修改

- 更改了数据库的数据挂载位置。默认配置是储存在`Docker`自己的卷（`volume`）下，改为了`/data/PostgreSQL`。

## 设置

### 用户

对于数据库的用户，默认的用户名是`postgres`，也可以通过修改环境变量`POSTGRES_USER`来指定。
需要注意的是，由于数据库已经通过外部储存来持久化了，所以修改密码后需要同时删除数据再创建，才能使新密码生效。

### 安全性

在`docker-compose.yml`中修改条目`POSTGRES_PASSWORD`以为数据库创建自己的密码。  

### 储存

数据库的数据部分默认储存在`/data/PostgreSQL`目录下。
