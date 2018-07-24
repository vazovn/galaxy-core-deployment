#!/bin/bash

MYDIR="$(dirname "$(realpath "$0")")"

source ${MYDIR}/../settings.sh

echo USER : galaxy
echo PASSWD : galaxy2018
echo DATABASE : galaxydb

sudo -i -u postgres -H sh -c "psql -c \"CREATE USER galaxy WITH PASSWORD 'galaxy2018';\""
systemctl restart postgresql-9.6
sudo -i -u postgres -H sh -c "psql -c \"CREATE DATABASE galaxydb OWNER galaxy;\""

echo "==============================================================================================="
echo "==========================  User and Database created ========================================="
echo "==============================================================================================="

