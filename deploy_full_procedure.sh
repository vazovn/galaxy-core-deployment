#!/bin/bash

# source settings
if [ ! -f "settings.sh" ]; then
    echo Please fill in the variables in the file settings.sh
    cp settings-template.sh settings.sh
    exit 1
fi

. settings.sh

if [ -z "${UIOUSER}" ]; then
    echo settings.sh is not complete
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
    sudo sh -c 'echo galaxy:x:182649:70731:galaxy:/home/galaxy:/bin/bash >> /etc/passwd'
	sudo mkdir /home/galaxy
	sudo chown galaxy:galaxy /home/galaxy/
fi

sudo yum install git

# Needed  to uglify the js files
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
sudo -u galaxy -H sh -c "${MYDIR}/configure_galaxy.sh ${production}"

## Customize Galaxy platform with Cluster and Project Management issues
if [ "${GALAXY_ABEL_MOUNT}" == "1" ]; then

	sudo mkdir -p  ${GALAXY_FILEPATH}     	# /work/projects/galaxy/data/database... /files
	sudo mkdir ${GALAXY_NEW_FILEPATH}   # /work/projects/galaxy/data/database... /tmp
	sudo mkdir ${GALAXY_JOB_WORKING_DIRECTORY} # /work/projects/galaxy/data/database... /job_working_directory
	sudo mkdir ${GALAXY_CLUSTER_FILES_DIRECTORY} # /work/projects/galaxy/data/database... /slurm

	# Install SLURM and MUNGE
	sh -c  "${MYDIR}/deploy_SLURM_MUNGE_rpm.sh"
	
	# Install Polish DRMAA library
	sh -c "${MYDIR}/deploy_DRMAA_poznan.sh"
	
	## Install Project management issues (most of them come from the lifeportal galaxy branch)
	sudo ln -sf ${EXTERNAL_DBS_PATH} ${EXTERNAL_DBS_LINK_NAME}
	sudo chown galaxy:galaxy ${EXTERNAL_DBS_LINK_NAME}
	
	## Change path to the Galaxy database (all files) directory (from local to cluster database)
	sudo mv ${GALAXYTREE}/database ${GALAXYTREE}/database.local.bkp
	sudo ln -s ${GALAXY_DATABASE_DIRECTORY_ON_CLUSTER} ${GALAXYTREE}/database
	

	# Add the customized environment variables file (local_env.sh)

	## GOLD DB setup
	if [ -f local_env.sh ]; then
		cp local_env.sh ${GALAXYTREE}/config
		sed -i -E "s,GOLDUSER,${GOLDDBUSER},"  local_env.sh
		sed -i -E "s,GOLDPASSWORD,${GOLDDBPASSWD},"  local_env.sh
		sed -i -E "s,GOLDHOST,${GOLDDBHOST},"  local_env.sh
		sed -i -E "s,GOLDDBNAME,${GOLDDB},"  local_env.sh
	fi

	# job_resource_params_conf.xml :
	if [ -f job_resource_params_conf.xml ]; then
		cp job_resource_params_conf.xml ${GALAXYTREE}/config
	elif [ ! -f job_resource_params_conf.xml ]; then
		echo -e "\nSomething is wrong here!!! Your job_resource_params_conf.xml is missing, copying job_resource_params_conf.xml.sample  ..."
		echo -e "Are you going to use cluster job parameters?\n"
		cp job_resource_params_conf.xml.sample job_resource_params_conf.xml
	fi
fi

## copy daemon script to /etc/init.d
sudo cp galaxyd /etc/init.d/
sudo chown root:root /etc/init.d/galaxyd

echo -e "\nAll features installed! What remains to be done:\n"
echo -e "Copy:  \n1. The munge.key from nielshenrik:/etc/munge/munge.key to <your host>:/etc/munge/munge.key\n"
echo -e "Editing: \n2.1. Edit job_conf.xml (Your job_resource_params_conf.xml is already configured, make sure your setup matches!)\n2. Edit /etc/sudoers for the galaxy-gold commands (see README.md in galaxy-project-management.repo)\n"
echo -e "Starting: \n3.1. Start munge service (sudo systemctl start munge.service)\n3.2. Start Galaxy (sudo /etc/init.d/galaxyd start)\n3.3. Check the log (tail -f /home/galaxy/galaxy/paster.log)\n"
echo -e "\nATTENTION!! When started for the first time, Galaxy will complain of missing python packages (e.g. drmaa_usit.py). Run the script venv_config.sh provided here and restart Galaxy again\n"
