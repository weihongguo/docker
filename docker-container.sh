#!/usr/bin/env bash

Usage() {
  cat <<EOF
Usage:
  run     run
  start   start
  stop    stop
  rm      rm
EOF
  exit 1
}

[ $# = 0 ] && Usage

[ $1 = 'help' ] && Usage

echo ${PWD}

source ./docker-config.sh

if [ $1 = 'run' ]; then
  sudo docker run -d --name ${container} ${vars} ${image}
elif [ $1 = 'start' ]; then
  sudo docker start ${container}
elif [ $1 = 'stop' ]; then
  sudo docker stop ${container}
elif [ $1 = 'rm' ]; then
  sudo docker rm ${container}
else
  Usage
fi
