#!/bin/bash

function join { local IFS="$1"; shift; echo "$*"; }
N=$(gotodo list --filename="/home/xg/Dropbox/todo/todo.txt" | wc -l)
tasks=$(gotodo list --filename="/home/xg/Dropbox/todo/todo.txt" --sort="rand" --pretty="%*40t"| tr '\n' "~" | sed 's/~/ | /g')


echo -n $N
echo -n ",%*"
echo $tasks
