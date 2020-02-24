#!/usr/bin/env bash

Usage() {
  cat <<EOF
Usage:
  init    init
  build   build
  rmi     rmi
  run     run
  start   start
  stop    stop
  rm      rm
EOF
  exit 1
}

[ $# = 0 ] && Usage

[ $1 = 'help' ] && Uasge

dockerpath=${PWD}
echo ${dockerpath}

cd ../
source ./docker-projects.sh

projectpath=${PWD}
echo ${projectpath}

if [ $1 = 'init' ]; then
  for project in ${projects[@]}
  do
    cd ${projectpath}/${project}
    echo ${PWD}
    
    if [ -d 'docker' ]; then
      rm -f ./docker/docker-image.sh
      rm -f ./docker/docker-container.sh
    else 
      mkdir docker
      cp ${dockerpath}/docker-config.sh ./docker/
      cp ${dockerpath}/Dockerfile ./docker/
    fi

    ln -s ${dockerpath}/docker-image.sh ./docker/
    ln -s ${dockerpath}/docker-container.sh ./docker/
  done
elif [ $1 = 'build']; then
  for project in ${projects[$]}
  do
    cd ${projectpath}/${project}
    echo ${PWD}
    ./docker/docker-image.sh build
  done
elif [ $1 = 'rmi']; then
  for project in ${projects[$]}
  do
    cd ${projectpath}/${project}
    echo ${PWD}
    ./docker/docker-image.sh rmi 
  done
elif [ $1 = 'run']; then
  for project in ${projects[$]}
  do
    cd ${projectpath}/${project}
    echo ${PWD}
    ./docker/docker-container.sh run 
  done
elif [ $1 = 'start']; then
  for project in ${projects[$]}
  do
    cd ${projectpath}/${project}
    echo ${PWD}
    ./docker/docker-container.sh start
  done
elif [ $1 = 'stop']; then
  for project in ${projects[$]}
  do
    cd ${projectpath}/${project}
    echo ${PWD}
    ./docker/docker-container.sh stop 
  done
elif [ $1 = 'rm']; then
  for project in ${projects[$]}
  do
    cd ${projectpath}/${project}
    echo ${PWD}
    ./docker/docker-container.sh rm 
  done
else
  Usage
fi
