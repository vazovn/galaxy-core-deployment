#!/bin/bash

## This is the main script for the full portal "Galaxy installation"

MYDIR="$(dirname "$(realpath "$0")")"
echo "MYDIR full procedure " ${MYDIR}

## Install Postgresql server: 
POSTGRESQL=$(systemctl --all | grep postgresql | awk '{print $5, $6}')
if  [ ! -z "$POSTGRESQL" ]; then
	echo "Postgresql server is installed and must be started if down!"
	echo "Version " $POSTGRESQL
else	
	echo -e "Postgresql server is not installed.\nPlease run the script 'deploy_postgresql.sh' in 'Postgresql' directory to install the postgresql server, then run this script again."
	read -p "Do you want to run the script now? [yN] " installpostgresql
	if [ "${installpostgresql}" == "y" ]; then
		sudo sh -c "${MYDIR}/Postgresql/deploy_postgresql.sh"
		sudo sh -c "${MYDIR}/Postgresql/create_user_and_db.sh"
	fi
fi
