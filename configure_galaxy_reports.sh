#!/bin/bash

echo "Params: $1"
production=$1

# source settings
. settings-reports.sh

MYDIR="$(dirname "$(realpath "$0")")"

cd ${GALAXYUSERHOME}
if [ -e "${GALAXYTREE}" ]; then
    echo ${GALAXYTREE} exists
    cd ${GALAXYTREE}
    git remote set-url origin ${GALAXY_GIT_REPO} 
    git pull
    #exit 1
else
    git clone -b ${GALAXY_GIT_BRANCH} ${GALAXY_GIT_REPO} 
fi

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

## Customize Galaxy platform with Cluster and Project Management issues
if [ "${GALAXY_ABEL_MOUNT}" == "1" ]; then
    
    ## Change path to the Galaxy database (all files) directory (from local to cluster database)
    mv ${GALAXYTREE}/database ${GALAXYTREE}/database.orig-$(date "+%y-%m-%d-%H%M") 2>&1 || echo $?
    ln -s ${GALAXY_DATABASE_DIRECTORY_ON_CLUSTER} ${GALAXYTREE}/database

fi

# Manage Galaxy config files

cd ${GALAXYTREE}/config

# galaxy ini:
if [ -f reports.ini ]; then
    cp reports.ini reports.ini.orig-$(date "+%y-%m-%d-%H%M") 
fi
cp reports.ini.sample reports.ini


## DB config
if [[ -n "${GALAXYDB}" && -n "${GALAXYDBUSER}" && -n "${GALAXYDBPASSWD}" && -n "${GALAXYDBHOST}" ]]; then
    dbstring="postgresql://${GALAXYDBUSER}:${GALAXYDBPASSWD}@${GALAXYDBHOST}/${GALAXYDB}"
    sed_replace '#database_connection.*' "database_connection = ${dbstring}" reports.ini
    echo "replaced db in reports.ini"
fi

## PATHS / DIRS
## Abel specific
if [ "${GALAXY_ABEL_MOUNT}" == "1" ]; then
    sed_replace '^#new_file_path =.*' "new_file_path = ${GALAXY_NEW_FILEPATH}" reports.ini
    sed_replace '^#file_path =.*' "file_path = ${GALAXY_FILEPATH}" reports.ini
fi

## SMTP / EMAILS
sed_replace '^#smtp_server =.*' 'smtp_server = smtp.uio.no' reports.ini
sed_replace '^#error_email_to =.*' "error_email_to = ${GALAXY_HELP_EMAIL}" reports.ini

## STATIC CONTENT
sed_replace '^# static_enabled =.*' 'static_enabled = True' reports.ini
sed_replace '^# static_cache_time =.*' 'static_cache_time = 360' reports.ini
sed_replace '^# static_dir =.*' 'static_dir = static/' reports.ini
sed_replace '^# static_images_dir =.*' 'static_images_dir = static/images' reports.ini
sed_replace '^# static_favicon_dir =.*' 'static_favicon_dir = static/favicon.ico' reports.ini
sed_replace '^# static_scripts_dir =.*' 'static_scripts_dir = static/scripts/' reports.ini
sed_replace '^# static_style_dir =.*' 'static_style_dir = static/june_2007_style/blue' reports.ini

## DEBUG
sed_replace '^#debug = False' 'debug =  True' reports.ini
    
echo "Exiting configure_galaxy.sh!!"
