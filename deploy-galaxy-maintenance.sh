#!/bin/bash

# WARNING !!! This script is a part of the main galaxy installation procedure and built into galaxy installation
# DO NOT run separately

# source settings
. settings.sh

if [ -f ${GALAXYTREE}/config/local_env.sh ]; then
        echo "local_env.sh found, OK ..."
else
        echo "local_env.sh not found, please check before deploying maintenance scripts!!"
        exit 1
fi

THISDIR=${PWD}
cd ${GALAXYUSERHOME}

git clone https://${USER}@bitbucket.usit.uio.no/scm/ft/galaxy-maintenance.git 

# e.g. /home/galaxy/galaxy
sed -i "s#GALAXYTREE=.*#GALAXYTREE=$GALAXYTREE#"  galaxy-maintenance/maintenance_local_env.sh
# e.g.  /home/galaxy
sed -i  "s#GALAXYUSERHOME=.*#GALAXYUSERHOME=$GALAXYUSERHOME#" galaxy-maintenance/maintenance_local_env.sh

echo "Galaxy maintenance kit installed in galaxy-maintenance. Do not forget to set the cron jobs for:"
echo "galaxy email management and mas_projects_maintenance as galaxy"

cd ${THISDIR}
