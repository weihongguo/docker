#!/usr/bin/env bash

source ./docker-config.sh

Usage() {
  cat <<EOF
Usage:
  build   "sudo docker build -t ${image}"
  rmi     "sudo docker rmi ${image}"
EOF
  exit 1
}

[ $# = 0 ] && Usage

[ $1 = 'help' ] && Usage

echo ${PWD}

if [ $1 = 'build' ]; then
  sudo docker build -t ${image}
elif [ $1 = 'rmi' ]; then
  sudo docker rmi ${image}
else
  Usage
fi
