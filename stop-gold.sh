#!/bin/bash

GOLD_PID=$(sudo ps -ef | grep perl | awk '/goldd start/{print $2}')

if [ -z "${GOLD_PID}" ]; then
   echo "GOLD is not running"
else
   kill -9 $GOLD_PID
fi
