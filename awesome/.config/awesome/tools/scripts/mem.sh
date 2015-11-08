#!/bin/bash

function pad {
        str=$1
        num=$2
        printf %`expr $num - ${#str}`s
        echo -n $str
}

TOTAL=`free | grep Mem | awk '{print $2}'`
USED=`free | grep - | awk '{print $3}'`
let PERCC=$USED*100/$TOTAL

pad $PERCC 3
