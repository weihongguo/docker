#!/usr/bin/env bash

Usage() {
  cat <<EOF
Usage:
  build   build
  rmi     rmi
EOF
  exit 1
}

[ $# = 0 ] && Usage

[ $1 = 'help' ] && Usage

echo ${PWD}

source ./docker-config.sh

if [ $1 = 'build' ]; then
  sudo docker build -t ${image}
elif [ $1 = 'rmi' ]; then
  sudo docker rmi ${image}
else
  Usage
fi