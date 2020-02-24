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
+ 目录结构
  + 基础目录：projects，
  + 工程目录：projects/project1，projects/project2，projects/projectN
+ 初始化
  + `cd projects`
  + `git clone git@github.com:weihongguo/docker.git`
  + `cp docker/docker-projects-demo.sh ./docker-projects.sh`
  + 编辑docker-projects.sh，把projects数组内容更改为当前工程列表
  + `cd docker`
  + `./docker.sh init`
  + 将会在每个工程下新建docker文件夹，以软连接方式生成docker-image.sh及docker-container.sh文件，同时会生成docker-config.sh及Dockerfile文件
+ 单个工程配置
  + `cd projets/projectX/docker`
  + 编辑docker-config.sh
  + 修改变量
    + image：镜像名称
    + container：容器名称
    + vars：启动容器的变量；如：`-p 80:80 -v xxx:yyy ...`；具体参考docker文档
+ 镜像操作
  + `cd projects/projectX/docker`
  + 编辑Dockerfile；具体参考docker文档
  + 构建：`./docker-image.sh build`
  + 删除：`./docker-image.sh rmi`
+ 容器操作
  + `cd projects/projectX/docker`
  + 运行：`./docker-container.sh run`
  + 开启：`./docker-contaner.sh start`
  + 停止：`./docker-container.sh stop`
  + 删除：`./docker-container.sh rm`
+ 操作所有工程
  + `cd projects/docker`
  + 构建：`./docker.sh build`
  + 删除：`./docker.sh rmi`
  + 运行：`./docker.sh run`
  + 开启：`./docker.sh start`
  + 停止：`./docker.sh stop`
  + 删除：`./docker.sh rm`
