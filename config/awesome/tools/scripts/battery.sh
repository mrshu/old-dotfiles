#!/bin/bash

function pad {
        str=$1
        num=$2
        printf %`expr $num - ${#str}`s
        echo -n $str
}

STATUS=$( acpi | awk '{print $3}' )

if [ "$STATUS" = "Discharging," ]
then
	STATUS="A"
else
	STATUS="AC"
fi


PERCENT=$( acpi | awk '{print $4}' )
PERCENT=${PERCENT%%"%,"}
PERCENT=${PERCENT%%"%"}
#PERCENT=${PERCENT%%","}
echo -n "$STATUS,"
pad $PERCENT 3
echo -n ','
TIME=$(acpi | grep -o '..:..:..')
if [ -n "$TIME" ]; then
        echo -n ' ('
        echo -n $TIME
        echo -n ')'
fi
