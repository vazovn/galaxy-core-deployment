#!/bin/bash

## This is the main script for the report galaxy server (lifeportal)

# source settings
if [ ! -f settings-reports.sh ]; then
    echo Please fill in the variables in the file settings-reports.sh
    cp settings-template-reports.sh settings-reports.sh
    exit 1
fi

. settings-reports.sh

if [ -z "${uiouser}" ]; then
    echo settings-reports.sh is not complete
fi

MYDIR="$(dirname "$(realpath "$0")")"
echo ${MYDIR}

# setup
if [ "$1" == "production" ]; then
    production=y
else
    read -p "Is this a production server? [yN] " production
fi

read -p "Mount /work on abel (host needs to be added to nfs on abel first)? [yN] " workonabel
read -p "Add galaxy user? [yN] " addgalaxyuser


if [ "${addgalaxyuser}" == "y" ]; then
    passwdstring="${GALAXYUSER}:x:${GALAXYUSERUID}:${GALAXYUSERGID}"
    passwdstring+=":${GALAXYGROUP}:${GALAXYUSERHOME}:/bin/bash"
    sudo sh -c "echo ${passwdstring} >> /etc/passwd"
	sudo mkdir ${GALAXYUSERHOME}
	sudo chown ${GALAXYUSER}:${GALAXYGROUP} ${GALAXYUSERHOME}
fi

sudo yum install git

# Needed to implement the Logout button
sudo yum install npm.x86_64

## Check it /work is a mounted directory
if [ "${workonabel}" == "y" ]; then
	if [ ! $(mount | grep "^admin.abel.uio.no:/work on /work") ]; then
		sudo mkdir /work
		sudo sed -i.orig-$(date "+%y-%m-%d-%H%M") -e "\$a# For /work/projects/galaxy\nadmin.abel.uio.no:/work    /work    nfs4    defaults    0 0" /etc/fstab
		sudo mount -a
	fi
fi

## Start main Galaxy platform installation/configuration script
sudo -u ${GALAXYUSER} -H sh -c "${MYDIR}/configure_galaxy_reports.sh ${production}"

## Customize Galaxy platform with Cluster and Project Management issues
if [ "${GALAXY_ABEL_MOUNT}" == "1" ]; then
        # check if rpcidmapd is not running
	if [[ -n $(systemctl status rpcidmapd | grep inactive) ]]; then 
            if grep --quiet "^#Domain = local.domain.edu" /etc/idmapd.conf; then
                sudo sed -i.orig-$(date "+%y-%m-%d-%H%M") "/^#Domain = local.domain.edu/a Domain = uio.no" /etc/idmapd.conf
                sudo systemctl enable rpcidmapd
                sudo systemctl start rpcidmapd
            else
                echo "Is idmapd installed?"
                exit 1
            fi
        fi
fi

## copy daemon script to /etc/init.d
sudo cp reports_galaxyd /etc/init.d/
sudo chown root:root /etc/init.d/reports_galaxyd

echo "# All features installed! What remains to be done:"

if [[ "${GALAXY_ABEL_MOUNT}" == "1" ]]; then
    cat ${MYDIR}/POST_INSTALLATION_ABEL_MOUNT_reports.md
else
    cat ${MYDIR}/POST_INSTALLATION_INDEPENDENT.md
fi


