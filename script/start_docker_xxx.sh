#!/bin/bash

set -e

USER_ID="$(id -u)"
XSOCK=/tmp/.X11-unix
XAUTH=$HOME/.Xauthority
SHARED_DOCKER_DIR=/root/workspace
SHARED_HOST_DIR=$HOME/

VOLUMES="--volume=$XSOCK:$XSOCK:rw
         --volume=$XAUTH:$XAUTH:rw
         --volume=$SHARED_HOST_DIR:$SHARED_DOCKER_DIR:rw
         --volume=/opt/data:/opt/data:rw"

#         --volume=$HOME/.docker_zsh_history:/root/.zsh_history:rw"
# --device=/dev/ttyUSB0:/dev/ttyUSB0 \
# --device=/dev/ttyUSB1:/dev/ttyUSB1 \
# --device=/dev/ttyUSB2:/dev/ttyUSB2 \
# cd && mkdir -p /run/sshd && /usr/sbin/sshd -p 22001 &&

xhost +local:docker
docker run \
    -it --rm \
    $VOLUMES \
    --env="XAUTHORITY=${XAUTH}" \
    --env="DISPLAY=${DISPLAY}" \
    --env="USER_ID=$USER_ID" \
    --hostname="xxx" \
    --privileged \
    --net=host \
    --ulimit core=-1 \
    --name="docker_container" \
    docker_image:tag \
    /bin/bash
    
