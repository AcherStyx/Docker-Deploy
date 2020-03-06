# PostgreSQL Docker部署

<!-- @import "[TOC]" {cmd="toc" depthFrom=2 depthTo=6 orderedList=false} -->

<!-- code_chunk_output -->

- [修改](#修改)
- [设置](#设置)
  - [用户登录](#用户登录)
    - [数据库用户](#数据库用户)
    - [pgAdmin用户](#pgadmin用户)
  - [安全性](#安全性)
  - [储存](#储存)

<!-- /code_chunk_output -->

用于做PostgreSQL数据库的基本部署，网络管理使用`pgAdmin`。  
另外有使用`Adminer`的版本在`docker-compose.with-adminer.yml`中。

## 修改

- 更改了数据库的数据挂载位置。  
- 添加了`pgAdmin`，使用`servers.json`来在首次部署的时候加载服务器信息。  

## 设置

### 用户登录

#### 数据库用户

对于数据库的用户，默认的用户名是`postgres`，也可以通过修改环境变量`POSTGRES_USER`来指定，修改之后需要同时修改`servers.json`中的用户名。  
需要注意的是，由于数据库已经通过外部储存来持久化了，所以修改密码后需要同时删除数据再创建，才能使新密码生效。  

#### pgAdmin用户

数据库的默认用户名为`user@domain.com`，通过环境变量`PGADMIN_DEFAULT_EMAIL`来指定。  
在其中连接数据库时，使用`db`作为数据库的`hostname`。  

### 安全性

在`docker-compose.yml`中修改`POSTGRES_PASSWORD`以为数据库创建自己的密码，修改`PGADMIN_DEFAULT_PASSWORD`以创建网页管理的登陆密码。  

### 储存

数据库的数据部分默认储存在`/data/PostgreSQL/db`目录下，`pgAdmin`的相关文件默认在`/data/PostgreSQL/pgamin`。
在使用前需要确保docker用户有使用**权限**。  
