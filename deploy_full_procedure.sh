#!/bin/bash

# source settings
if [ ! -f "settings.sh" ]; then
    echo Please fill in the variables in the file settings.sh
    cp settings-template.sh settings.sh
    exit 1
fi

. settings.sh

if [ ! -z "${UIOUSER}" ]; then
    echo settings.sh is not complete
fi

MYDIR="$(dirname "$(realpath "$0")")"
echo ${MYDIR}

# db
read -p "Database url on the form: postgresql://username:password@localhost/mydatabase (leave empty for local sqlite)\n> " dburl

# setup
if [ "$1" == "production" ]; then
    production=y
else
    read -p "Is this a production server? [yN] " production
fi

read -p "Mount /work on abel (host needs to be added to nfs on abel first)? [yN] " workonabel

read -p "Add galaxy user? [yN] " addgalaxyuser
if [ "${addgalaxyuser}" == "y" ]; then
    sudo sh -c 'echo galaxy:x:182649:70731:galaxy:/home/galaxy:/bin/bash >> /etc/passwd'
sudo mkdir /home/galaxy
sudo chown galaxy:galaxy /home/galaxy/
fi
sudo yum install git

if [ "${workonabel}" == "y" ]; then
    sudo mkdir /work
    sudo sed -i.orig-$(date "+%y-%m-%d-%H%M") -e "\$a# For /work/projects/galaxy\nadmin.abel.uio.no:/work    /work    nfs4    defaults    0 0" /etc/fstab
    sudo mount -a
fi

## Start main Galaxy platform installation/configuration script
sudo -u galaxy -H sh -c "${MYDIR}/configure_galaxy.sh ${production} ${dburl}"

## Customize Galaxy platform with Cluster and Project Management issues
if [ "${GALAXY_ABEL_MOUNT}" == "1" ]; then

	# Install SLURM and MUNGE
	sh -c deploy_SLURM_MUNGE_rpm.sh
	
	# Install Polish DRMAA library
	sh -c deploy_DRMAA_poznan.sh
	
	## Install Project management issues (most of them come from the lifeportal galaxy branch)
	sudo ln -sf ${EXTERNAL_DBS_PATH} ${EXTERNAL_DBS_LINK_NAME}
	sudo chown galaxy:galaxy ${EXTERNAL_DBS_LINK_NAME}
	
	# Uglify the new menu
	sudo yum install npm.x86_64
	sudo su galaxy
	cd ${GALAXYTREE}/client
	make client
	
	# Modify $PYTHONPATH in .venv
	echo 'export GALAXY_LIB=/home/galaxy/galaxy/lib' >> /home/galaxy/galaxy/.venv/bin/activate
	echo 'export PYTHONPATH=$GALAXY_LIB:/home/galaxy/galaxy/lib/usit/python' >> /home/galaxy/galaxy/.venv/bin/activate
	echo "PYTHONPATH SET IN .venv/bin/activate " $PYTHONPATH 
	
fi

echo -e "\nAll features installed! What remains to be done:\n"
echo -e "Editing: \n1. Edit job_conf.xml\n2. Edit job_resource_params_conf.xml\n3. Edit /etc/sudoers for the galaxy-gold commands (see README.md in galaxy-project-management.repo)\n"
echo -e "Starting: \n1. Start munge service (sudo systemctl start munge.service)\n2. Start Galaxy (sudo /etc/init.d/galaxyd start)\n3. Check the log (tail -f /home/galaxy/galaxy/paster.log)\n"
