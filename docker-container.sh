#!/usr/bin/env bash

source ./docker-config.sh

Usage() {
  cat <<EOF
Usage:
  run     "sudo docker run -d --name ${container} ${vars} ${image}"
  start   "sudo docker start ${container}"
  stop    "sudo docker stop ${container}"
  rm      "sudo docker rm ${container}"
  exec    "sudo docker exec -it ${container} bash"
EOF
  exit 1
}

[ $# = 0 ] && Usage

[ $1 = 'help' ] && Usage

echo ${PWD}

if [ $1 = 'run' ]; then
  sudo docker run -d --name ${container} ${vars} ${image}
elif [ $1 = 'start' ]; then
  sudo docker start ${container}
elif [ $1 = 'stop' ]; then
  sudo docker stop ${container}
elif [ $1 = 'rm' ]; then
  sudo docker rm ${container}
elif [ $1 = 'exec' ]; then
  sudo docker exec -it ${container} bash
else
  Usage
fi
