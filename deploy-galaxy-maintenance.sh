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

if [ -e "galaxy-maintenance" ]; then
    echo "Galaxy maintenance kit found ... Removing old installation ..."
    rm -rf galaxy-maintenance
    git clone https://${USER}@bitbucket.usit.uio.no/scm/ft/galaxy-maintenance.git 
else
    git clone https://${USER}@bitbucket.usit.uio.no/scm/ft/galaxy-maintenance.git
fi

# e.g. /home/galaxy/galaxy
sed -i "s#GALAXYTREE=.*#GALAXYTREE=$GALAXYTREE#"  galaxy-maintenance/maintenance_local_env.sh

# e.g.  /home/galaxy
sed -i  "s#GALAXYUSERHOME=.*#GALAXYUSERHOME=$GALAXYUSERHOME#" galaxy-maintenance/maintenance_local_env.sh

sed -i  "s#GALAXYUSERHOMEPATH#$GALAXYUSERHOME#" galaxy-maintenance/scripts/galaxy_emails_management/run_get_galaxy_user_emails.sh
sed -i  "s#GALAXYUSERHOMEPATH#$GALAXYUSERHOME#" galaxy-maintenance/scripts/lifeportal_usage_report/run_lifeportal_usage_report.sh
sed -i  "s#GALAXYUSERHOMEPATH#$GALAXYUSERHOME#" galaxy-maintenance/scripts/manipulate_project_allocations/run_manipulate_allocations_end_date.sh
sed -i  "s#GALAXYUSERHOMEPATH#$GALAXYUSERHOME#" galaxy-maintenance/scripts/mas_projects_maintenance/run_mas_projects_management.sh
sed -i  "s#GALAXYUSERHOMEPATH#$GALAXYUSERHOME#" galaxy-maintenance/scripts/rogue_users/run_check_rogue_users.sh

echo "Galaxy maintenance kit installed in galaxy-maintenance. Do not forget to set the cron jobs for:"
echo "galaxy email management and mas_projects_maintenance as galaxy"

cd ${THISDIR}
