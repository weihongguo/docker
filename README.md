# docker
## 整体说明
这是docker常用命令的shell脚本<br>
主要包括三个文件
+ docker.sh：主脚本
  + 初始化：`docker.sh init`
  + 根据参数调用docker-image.sh处理镜像操作：`docker.sh build/rmi`
  + 根据参数调用docker-container.sh处理容器操作：`docker.sh run/start/stop/rm`
+ docker-image.sh：镜像脚本
  + 构建镜像：`docker-image.sh build`
  + 删除镜像：`cocker-image.sh rmi`
+ docker-container.sh：容器脚本
  + 运行容器：`docker-container.sh run`
  + 开启容器：`docker-container.sh start`
  + 停止容器: `docker-container.sh stop`
  + 删除容器：`docker-container.sh rm`
## 使用说明

