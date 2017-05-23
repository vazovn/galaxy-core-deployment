#!/bin/bash

# source settings
. ${MYDIR}/../settings.sh


# Set the correct paths in the cluster partition for filesender. This operation shall be done here
# as galaxy user, because the nfs mount is root squash. Root can not run these commands on nielshenrik.
# To complete the setup, log into nielshenrik and run 
# chown -R apache FILESENDER_STORAGE

echo "deploy_filesender_galaxy_config : Making Filesender storage directories on cluster ... "

mkdir -p ${FILESENDER_STORAGE}/log
mkdir -p ${FILESENDER_STORAGE}/tmp
mkdir -p ${FILESENDER_STORAGE}/files

echo "deploy_filesender_galaxy_config : Editing Galaxy configuration files required by Filesender setup..."

function sed_replace {
    # TODO check if string contains %
    if [ -z "$2" ]; then
        echo "Error in replacing of line $1 in $3"
        exit 1
    fi
    if [[ "${2:(-4)}" == "SKIP" ]]; then
        echo "$1 not changed"
    elif grep --quiet "$1" $3; then
        sed -i -E "s%$1%$2%" $3
    echo "replaced $1 with $2"
    else
        echo "Line matching /$1/ not found in $3"
        exit 1
    fi
    }

## edit local_env.sh
if [ -f ${GALAXYTREE}/config/local_env.sh ]; then
        echo "local_env.sh found, OK ..."
else
        echo "local_env.sh not found, please check before deploying maintenance scripts!!"
        exit 1
fi

if [[ -n "${FILESENDERUSER}" && -n "${FILESENDERPASSWORD}" && -n "${FILESENDERHOST}" && -n "${FILESENDERDBNAME}" ]]; then
        filesenderdbstring="postgresql://${FILESENDERUSER}:${FILESENDERPASSWORD}@${FILESENDERHOST}/${FILESENDERDBNAME}"
        sed_replace '^export FILESENDERDB=.*' "export FILESENDERDB=${filesenderdbstring}" ${GALAXYTREE}/config/local_env.sh
        echo "replaced filesender db in local_env.sh"
else
	echo "Filesender db settings missing from settings.sh"
fi

if [ -n "${FILESENDER_STORAGE}" ]; then
		sed_replace '^export FILESENDER_STORAGE=.*' "export FILESENDER_STORAGE=${FILESENDER_STORAGE}" ${GALAXYTREE}/config/local_env.sh
    fi

## edit galaxy.ini

sed_replace '^# webhooks_dir=.*' "webhooks_dir = config/plugins/webhooks/demo" ${GALAXYTREE}/config/galaxy.ini

sed_replace '^#ftp_upload_dir=.*' "ftp_upload_dir = ${GALAXYTREE}/database/ftp/user_upload" ${GALAXYTREE}/config/galaxy.ini
sed_replace '^#ftp_upload_site=.*' "ftp_upload_site = Galaxy FTP Upload site for big files" ${GALAXYTREE}/config/galaxy.ini
sed_replace '^#ftp_upload_dir_identifier=.*' "ftp_upload_dir_identifier = email" ${GALAXYTREE}/config/galaxy.ini
sed_replace '^#ftp_upload_dir_template' "ftp_upload_dir_template" ${GALAXYTREE}/config/galaxy.ini
sed_replace '^#ftp_upload_purge=.*' "ftp_upload_purge = False" ${GALAXYTREE}/config/galaxy.ini

# edit filesender webhook file
sed_replace 'FILESENDER_URL' "${FILESENDER_URL}" ${GALAXYTREE}/config/plugins/webhooks/demo/filesender/config/filesender.yaml

echo "=== Galaxy Filesender configuration files ready. === "
