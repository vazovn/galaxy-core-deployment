#!/bin/bash

if [[ ${USER} != "gold" && ${USER} != "root" ]]; then
    echo "Gold can not be stopped from ${USER}"
    exit 1
fi

/opt/gold/sbin/goldd --stop
