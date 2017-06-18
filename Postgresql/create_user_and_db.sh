#!/bin/bash

MYDIR="$(dirname "$(realpath "$0")")"

source ${MYDIR}/../settings.sh

echo USER : ${GALAXYDBUSER}
echo PASSWD : ${GALAXYDBPASSWD}
echo DATABASE : ${GALAXYDB}

sudo -i -u postgres -H sh -c "psql -c \"CREATE USER $GALAXYDBUSER WITH PASSWORD '$GALAXYDBPASSWD';\""
systemctl restart postgresql-9.4
sudo -i -u postgres -H sh -c "psql -c \"CREATE DATABASE $GALAXYDB OWNER $GALAXYDBUSER;\""

echo "==============================================================================================="
echo "==========================  User and Database created ========================================="
echo "==============================================================================================="
