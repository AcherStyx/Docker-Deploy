# OpenDayLight

这一部分用于通过Docker部署ODL控制器，版本选择了`karaf-0.8.4`，其他版本没有进行测试。

## 安装

### 下载程序

首先需要**手动下载**ODL程序，通过运行`download.sh`可以完成下载。  

```sh
bash download.sh
```

但是大多时候这种方式速度都比较慢，推荐手动通过其他方式从[这里](https://nexus.opendaylight.org/content/repositories/public/org/opendaylight/integration/karaf/0.8.4/karaf-0.8.4.tar.gz)下载文件`karaf-0.8.4.tar.gz`，然后放到同目录即可。  

### 建立镜像

通过`docker-compose`创建镜像即可。  

```sh
docker-compose up
```

### 运行karaf

首先需要进入到镜像中：

```sh
docker exec -it odl_controller bash
```

之后即可通过调用`karaf`命令启动。

```shell
root@ad80d6190213:/home# karaf 
karaf: JAVA_HOME not set; results may vary
Apache Karaf starting up. Press Enter to open the shell now...
100% [========================================================================]
Karaf started in 1s. Bundle stats: 54 active, 55 total
                                                                                           
    ________                       ________                .__  .__       .__     __       
    \_____  \ ______   ____   ____ \______ \ _____  ___.__.|  | |__| ____ |  |___/  |_     
     /   |   \\____ \_/ __ \ /    \ |    |  \\__  \<   |  ||  | |  |/ ___\|  |  \   __\    
    /    |    \  |_> >  ___/|   |  \|    `   \/ __ \\___  ||  |_|  / /_/  >   Y  \  |      
    \_______  /   __/ \___  >___|  /_______  (____  / ____||____/__\___  /|___|  /__|      
            \/|__|        \/     \/        \/     \/\/            /_____/      \/          
                                                                                           

Hit '<tab>' for a list of available commands
and '[cmd] --help' for help on a specific command.
Hit '<ctrl-d>' or type 'system:shutdown' or 'logout' to shutdown OpenDaylight.

opendaylight-user@root>
```

## 文件挂载

> 即使不这么做，只要不删除已经创建的容器，你所做的更改仍然可以被保留。  

如果需要持久化`karaf`的配置，可以在`docker-compose`中指定并替换目录,该目录下需要包含已经解压好的karaf程序：

```yml
    volumes:
      - /path/to/karaf:/home/karaf-0.8.4
```

同时使用`Dockerfile.without_karaf`（删除了文件拷贝过程的版本）替换原本的`Dockerfile`：

```yml
    build: 
      context: .
      dockerfile: Dockerfile.without_karaf
```

### 持久化示例

`docker-compose`修改为类似形式：

```yml
version: "3"

services: 
  odl:
    build: 
      context: .
      dockerfile: Dockerfile.without_karaf
    container_name: odl_controller
    restart: always

    ports:
      - 8181:8181
      - 6653:6653
      - 6633:6633

    volumes:
      - /data/karaf:/home/karaf-0.8.4

    tty: true
    stdin_open: true
```

并且在该示例中，将`karaf`放在`/data/karaf`目录即可。  
