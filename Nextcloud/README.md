# Nextcloud

Nextcloud个人云储存，通过镜像的组合扩展了以下功能：

- Redis数据库加速
- 定时执行Cron（待验证）
- Nginx反向代理
- 自签名SSL证书

## 端口

默认采用`80`和`443`端口，分别提供给`http`和`https`。  

## 部署

### Step 1. 配置密码

密码相关的配置，主要如下表所示。

| 环境变量 |用途 | 位置 |
| -------- | ---- |---|
|    `MYSQL_ROOT_PASSWORD` *| 数据库管理员密码     | `docker-compose.yml` |
| `MYSQL_PASSWORD` * | 数据库用户密码 | `db.env` |
| `NEXTCLOUD_ADMIN_USER` | Nextcloud管理员用户名 | `docker-compose.yml`|
| `NEXTCLOUD_ADMIN_PASSWORD` | Nextcloud管理员密码 |`docker-compose.yml`|

> 其中带 * 的为必需，另外的Nextcloud账户名密码可以之后在页面上设置。
> 另外`docker-compose.yml`中还包含Nextcloud的一些可选配置。

### Step 2. 设置存储路径

默认的存储全部使用Docker提供的卷，卷删除之后数据随即丢失。  
如果需要指定数据存储路径，需在`docker-compose.yml`修改以下的卷出现的所有位置。

| 卷 | 作用 |
| ---| ---|
| `db` | 数据库文件 |
| `nextcloud`  | Nextcloud数据文件|

其余的卷均是用于添加SSL以进行HTTPS访问的，文件可自动生成。

> :warning: 一定要保证Docker对指定的存储路径有读写权限，否则容器会不断重启（`docker ps`）。

### Step 3. 运行部署

```shell
docker-compose up -d --build
```
