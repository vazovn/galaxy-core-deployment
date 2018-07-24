#! /bin/bash

read -p "Are you running this script as root (sudo) [yN]" iamsudo
if [ "${iamsudo}" == "y" ]; then
	:
else
	exit 1
fi

## Postgresql
systemctl stop postgresql-9.6.service
yum erase postgresql96*
cd /var/lib
rm -rf pgsq
