#!/bin/bash
#
#amixer get Master | grep "Front Left:" | awk '{print $5}' > /tmp/vollevel.out
#RES=$( cat /tmp/vollevel.out )
function pad {
        str=$1
        num=$2
        printf %`expr $num - ${#str}`s
        echo -n $str
}

cat /proc/asound/card0/codec\#0 | awk '/Speaker Phantom Jack/,/Power/'| grep 'Pin-ctls: .* OUT' > /dev/null


# Headphones detection
#if [[ $? -eq 0 ]]; then
#        RES=$( amixer get Master | grep "Mono:" | awk '{print $4}' )
#else
#        RES=$( amixer get Headphone | grep "Front Left:" | awk '{print $5}' )
#fi

RES=$( amixer get Master | grep "Mono:" | awk '{print $4}' )
#echo -e $RES
#RES="[30%]"
RES=${RES##"["}
RES=${RES%%"%]"}

amixer get Master | grep "off" > /dev/null
if [[ $? -eq 0 ]]; then
        RES="${RES}M"
else
        RES="${RES}%"
fi

pad $RES 4
