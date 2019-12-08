#!/bin/bash

TASK="latex"
VERSION="latest"

if ( ! systemctl -q is-active docker.servie )
then
    sudo systemctl start docker
fi



if ( $# -gt 0 )
then
    docker run --name $TASK -it --rm -v $PWD:/$TASK/input $TASK:$VERSION
else
    docker run --name $TASK -it --rm -v $PWD:/$TASK/input $TASK:$VERSION $@
fi
