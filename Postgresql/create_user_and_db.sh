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

read -p "Do you want to proceed with the rest of the Galaxy installation ? [yN]" proceed_after_user_db_created
if [ ! "${proceed_after_user_db_created}" == "y" ]; then
	echo "Galaxy installation will quit now!"	
	exit 1
fi
