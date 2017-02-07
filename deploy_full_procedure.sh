#!/bin/bash

## This is the main script for the full portal "Galaxy installation"
## It
## -- installs SLURM, MUNGE, DRMAA, GOLD
## -- implements the customized features for the USIT postals (Project/Job management, etc.)
## -- configures Galaxy framework respectively


# source settings
if [ ! -f settings.sh ]; then
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
read -p "Install GOLD? [yN] " installgold
read -p "Install Slurm and Munge? [yN] " installslurmandmunge
read -p "Install DRMAA poznan? [yN] " installdrmaapoznan
read -p "Install Galaxy maintenance kit ? [yN] " installgalaxymaintenancekit

if [ "${addgalaxyuser}" == "y" ]; then
    passwdstring="${GALAXYUSER}:x:${GALAXYUSERUID}:${GALAXYUSERGID}"
    passwdstring+=":${GALAXYGROUP}:${GALAXYUSERHOME}:/bin/bash"
    sudo sh -c "${passwdstring} >> /etc/passwd"
	sudo mkdir ${GALAXYUSERHOME}
	sudo chown ${GALAXYUSER}:${GALAXYGROUP} ${GALAXYUSERHOME}
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

	sudo mkdir -p ${GALAXY_DATABASE_DIRECTORY_ON_CLUSTER}     	# /work/projects/galaxy/data/database... /files
	sudo chown galaxy:galaxy ${GALAXY_DATABASE_DIRECTORY_ON_CLUSTER}
	
	# Install GOLD
	if [ "${installgold}" == "y" ]; then 
	    
	    ## need gcc and cpanm 
		sudo yum install gcc.x86_64
		sudo yum install perl-App-cpanminus.noarch
	    
	    sudo useradd -m gold 2>&1 || echo $?
	    sudo -u gold -H sh -c "${MYDIR}/deploy-gold-user.sh"
	    sudo sh -c "${MYDIR}/deploy-gold-root.sh"
	    
    fi
	
	# Install SLURM and MUNGE
	if [ "${installslurmandmunge}" == "y" ]; then 
	    sh -c  "${MYDIR}/deploy_SLURM_MUNGE_rpm.sh"
        fi
	
	# Install Polish DRMAA library
	if [ "${installdrmaapoznan}" == "y" ]; then 
	    sh -c "${MYDIR}/deploy_DRMAA_poznan.sh"
        fi
        
    # Install galaxy maintenance kit
    if [ "${installgalaxymaintenancekit}" == "y" ]; then 
        sh -c "${MYDIR}/deploy-galaxy-maintenance.sh"
        fi

fi

## copy daemon script to /etc/init.d
sudo cp galaxyd /etc/init.d/
sudo chown root:root /etc/init.d/galaxyd

echo "# All features installed! What remains to be done:"

if [[ "${GALAXY_ABEL_MOUNT}" == "1" ]]; then
    echo
    echo "## Copy Munge key (if munge is installed):"
    echo " ssh -t ${USER}@nielshenrik.abel.uio.no \"sudo scp /etc/munge/munge.key ${USER}@${HOSTNAME}:/tmp/newmungekey.key\""
    echo " sudo mv /tmp/newmungekey.key /etc/munge/munge.key" 
    echo " sudo chown daemon:root /etc/munge/munge.key"
    cat ${MYDIR}/POST_INSTALLATION_ABEL_MOUNT.md
else
    cat ${MYDIR}/POST_INSTALLATION_INDEPENDENT.md
fi


