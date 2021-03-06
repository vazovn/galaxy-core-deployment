#!/bin/bash

## This is the main script for the full portal "Galaxy installation"
## It
## -- installs SLURM, MUNGE, DRMAA, GOLD
## -- implements the customized features for the USIT postals (Project/Job management, etc.)
## -- configures Galaxy framework respectively

# add prompt rule
sudo cp galaxyprompt.sh /etc/profile.d/z_galaxyprompt.sh

# source settings
if [ ! -f settings.sh ]; then
    echo Please fill in the variables in the file settings.sh
    cp settings-template.sh settings.sh
    exit 1
fi

. settings.sh

if [ -z "${uiouser}" ]; then
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
read -p "Install Filesender (Big file upload) ? [yN] " installfilesender

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

## Check it /work is a mounted directory
if [ "${workonabel}" == "y" ]; then
	if [ ! $(mount | grep "^admin.abel.uio.no:/work on /work") ]; then
		sudo mkdir /work
		sudo sed -i.orig-$(date "+%y-%m-%d-%H%M") -e "\$a# For /work/projects/galaxy\nadmin.abel.uio.no:/work    /work    nfs4    defaults    0 0" /etc/fstab
		sudo mount -a
	fi
fi

## Start main Galaxy platform installation/configuration script
sudo -u ${GALAXYUSER} -H sh -c "${MYDIR}/configure_galaxy.sh ${production}"

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
        sudo -u ${GALAXYUSER} -H sh -c "${MYDIR}/deploy-galaxy-maintenance.sh"
        sudo -H sh -c "echo 30 0 \* \* \* $GALAXYUSER $GALAXYUSERHOME/galaxy-maintenance/scripts/mas_projects_maintenance/run_mas_projects_management.sh >> /etc/crontab"
    fi
    
    # Install Filesender
    if [ "${installfilesender}" == "y" ]; then 
		
		cd ${MYDIR}/filesender_setup
		sudo sh -c "./deploy_filesender_root.sh"

		## fix the selinux context for filesender and simplesaml

		sudo semanage fcontext -a -t httpd_sys_content_t -s system_u '/opt/filesender(/.*)?'
		sudo semanage fcontext -a -t httpd_sys_rw_content_t -s system_u '/opt/filesender/filesender/(log|tmp|files)(/.*)?'
		sudo semanage fcontext -a -t httpd_sys_rw_content_t -s system_u '/opt/filesender/simplesaml/log(/.*)?'
		sudo restorecon -FR /opt/filesender
		
		# edit Galaxy config files
		sudo -u ${GALAXYUSER} -H sh -c "./deploy_filesender_galaxy_config.sh"

		# Last instructions:
		echo -e "\n==== LAST INSTRUCTIONS FOR Filesender SETUP ==== \n"
		## The filesender storage and simplesaml logs directory must belong to 'apache' user (or nobody) and be writable for group 'galaxy'
		echo "Log into nh.abel as root"
		echo "cd to ABEL_FILESENDER_PATH (e.g. /work/projects/galaxy/) and run :"
		echo "chown -R apache filesender"
		echo "chmod -R g+w filesender"
                echo "cd to ABEL_SIMPLESAML_PATH (e.g. /work/projects/galaxy/) and run :"
                echo "chown -R apache simplesaml"
                echo "chmod -R g+w simplesaml"
		echo -e "\nInitilalize filesender database ====\n"
		echo "sudo php /opt/filesender/filesender/scripts/upgrade/database.php"
		echo -e "\n==== Filesender setup READY! ====\n\n"

		# Get back to the main level
		cd ${MYDIR}
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
