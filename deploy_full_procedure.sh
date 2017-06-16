#!/bin/bash

## This is the main script for the full portal "Galaxy installation"

## Install Apache
APACHE=$(systemctl --all | grep httpd | awk '{print $5, $6}')
if  [ ! -z "$APACHE" ]; then
	echo "Apache is installed and must be started if down!"
	echo "Version " $APACHE
else	
	echo "Apache server is not installed.\nPlease run the script 'deploy_apache.sh' in 'Apache' directory to install the Apache server, then run this script again."
	exit 1
fi

## Install Postgresql server: 
POSTGRESQL=$(systemctl --all | grep postgresql | awk '{print $5, $6}')
if  [ ! -z "$POSTGRESQL" ]; then
	echo "Postgresql server is installed and must be started if down!"
	echo "Version " $POSTGRESQL
else	
	echo -e "Postgresql server is not installed.\nPlease run the script 'deploy_postgresql.sh' in 'Postgresql' directory to install the postgresql server, then run this script again."
	exit 1
fi

# add prompt rule
sudo cp galaxyprompt.sh /etc/profile.d/z_galaxyprompt.sh

# source settings
if [ ! -f settings.sh ]; then
    echo Please fill in the variables in the file settings.sh
    cp settings-template.sh settings.sh
    exit 1
fi

. settings.sh

MYDIR="$(dirname "$(realpath "$0")")"
echo ${MYDIR}

# setup
if [ "$1" == "production" ]; then
    production=y
else
    read -p "Is this a production server? [yN] " production
fi

## Create galaxy user
passwdstring="${GALAXYUSER}:x:${GALAXYUSERUID}:${GALAXYUSERGID}"
passwdstring+=":${GALAXYGROUP}:${GALAXYUSERHOME}:/bin/bash"
sudo sh -c "${passwdstring} >> /etc/passwd"
sudo mkdir ${GALAXYUSERHOME}
sudo chown ${GALAXYUSER}:${GALAXYGROUP} ${GALAXYUSERHOME}

sudo yum install git

## Start main Galaxy platform installation/configuration script
sudo -u ${GALAXYUSER} -H sh -c "${MYDIR}/configure_galaxy.sh ${production}"

## copy daemon script to /etc/init.d
sudo cp galaxyd /etc/init.d/
sudo chown root:root /etc/init.d/galaxyd

echo "# All features installed! What remains to be done:"
cat ${MYDIR}/POST_INSTALLATION.md

