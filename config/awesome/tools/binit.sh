#!/bin/bash

mkdir -p /dev/shm/tmp
mkdir -p /dev/shm/bashets
SCRIPTPATH=$( cd $(dirname $0) ; pwd -P )
cp $SCRIPTPATH/scripts/* /dev/shm/bashets/

