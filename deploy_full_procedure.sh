#!/bin/bash

## This is the main script for the full portal "Galaxy installation"

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

read -p "Add galaxy user? [yN] " addgalaxyuser

if [ "${addgalaxyuser}" == "y" ]; then
    passwdstring="${GALAXYUSER}:x:${GALAXYUSERUID}:${GALAXYUSERGID}"
    passwdstring+=":${GALAXYGROUP}:${GALAXYUSERHOME}:/bin/bash"
    sudo sh -c "${passwdstring} >> /etc/passwd"
	sudo mkdir ${GALAXYUSERHOME}
	sudo chown ${GALAXYUSER}:${GALAXYGROUP} ${GALAXYUSERHOME}
fi

sudo yum install git

# Needed  to uglify the js files

if [ -f /etc/profile.d/bash_login.sh ]; then
	source /etc/profile.d/bash_login.sh
else
	sudo touch /etc/profile.d/bash_login.sh
fi

if  [ -x "$(command -v npm)" ]; then
	echo "Node/npm is installed and run from $(command -v npm)"	
else
	echo "Installing Nodejs/npm ... "
	sudo yum install nodejs010*
	sudo yum install v8314*
	sudo echo -e "export PATH=/opt/rh/nodejs010/root/usr/bin/:$PATH" >> /etc/profile.d/bash_login.sh
	sudo echo -e "export PATH=/opt/rh/v8314/root/bin/:$PATH" >> /etc/profile.d/bash_login.sh
	source /etc/profile.d/bash_login.sh
fi

## Start main Galaxy platform installation/configuration script
sudo -u ${GALAXYUSER} -H sh -c "${MYDIR}/configure_galaxy.sh ${production}"

## copy daemon script to /etc/init.d
sudo cp galaxyd /etc/init.d/
sudo chown root:root /etc/init.d/galaxyd

echo "# All features installed! What remains to be done:"
cat ${MYDIR}/POST_INSTALLATION.md

