#!/bin/bash

echo "Params: $1"
production=$1

# source settings
. settings.sh


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

# Manage Galaxy config files

cd ${GALAXYTREE}/config

# galaxy ini:
if [ -f galaxy.ini ]; then
    cp galaxy.ini galaxy.ini.orig-$(date "+%y-%m-%d-%H%M") 
fi
cp galaxy.ini.sample galaxy.ini

# disable debug and use_interactive for production
echo "production?"
echo ${production}
if [ "${production}" == "y" ]; then
        sed_replace '^use_interactive = .*' 'use_interactive = False' galaxy.ini
        echo "replaced debug and use_interactive from galaxy.ini"
fi

## General
sed_replace '^#port =.*' 'port = 8080' galaxy.ini
sed_replace '^#host =.*' 'host = 127.0.0.1' galaxy.ini

## DB config
if [[ -n "${GALAXYDB}" && -n "${GALAXYDBUSER}" && -n "${GALAXYDBPASSWD}" && -n "${GALAXYDBHOST}" ]]; then
    dbstring="postgresql://${GALAXYDBUSER}:${GALAXYDBPASSWD}@${GALAXYDBHOST}/${GALAXYDB}"
    sed_replace '#database_connection.*' "database_connection = ${dbstring}" galaxy.ini
    echo "replaced db in galaxy.ini"
fi

## CONFS
if [ "${GALAXY_TOOL_CONF}" != "" ]; then
    sed_replace '^#tool_config_file =.*' "tool_config_file = ${GALAXY_TOOL_CONF}" galaxy.ini
fi
sed_replace '^#datatypes_config_file.*' "datatypes_config_file = ${GALAXY_DATATYPES_CONF}" galaxy.ini
# sed_replace '^#integrated_tool_panel_config.*' 'integrated_tool_panel_config = integrated_tool_panel.xml' galaxy.ini
sed_replace '^#tool_data_table_config_path = config/tool_data_table_conf.xml' "tool_data_table_config_path = ${GALAXY_TOOL_DATA_TABLE_CONF}" galaxy.ini

## TOOL-DATA FOLDER
sed_replace '^#tool_data_path = tool-data' "tool_data_path = ${GALAXY_TOOL_DATA_LOCAL}" galaxy.ini

## TOOLS FOLDER
sed_replace '^#tool_path.*' "tool_path = ${GALAXY_TOOL_PATH}" galaxy.ini

## SMTP / EMAILS
sed_replace '^#smtp_server =.*' 'smtp_server = smtp.uio.no' galaxy.ini
sed_replace '^#error_email_to =.*' "error_email_to = ${GALAXY_HELP_EMAIL}" galaxy.ini

## BRAND
sed_replace '^#brand = None' "brand = ${GALAXY_BRAND}" galaxy.ini

## STATIC CONTENT
sed_replace '^#static_enabled = True' 'static_enabled = True' galaxy.ini
sed_replace '^#static_cache_time = 360' 'static_cache_time = 360' galaxy.ini
sed_replace '^#static_dir = static/' 'static_dir = static/' galaxy.ini
sed_replace '^#static_images_dir = static/images' 'static_images_dir = static/images' galaxy.ini
sed_replace '^#static_favicon_dir = static/favicon.ico' 'static_favicon_dir = static/favicon.ico' galaxy.ini
sed_replace '^#static_scripts_dir = static/scripts/' 'static_scripts_dir = static/scripts/' galaxy.ini
sed_replace '^#static_style_dir = static/june_2007_style/blue' 'static_style_dir = static/june_2007_style/blue' galaxy.ini
sed_replace '^#static_robots_txt = static/robots.txt' 'static_robots_txt = static/robots.txt' galaxy.ini

## DEBUG
sed_replace '^#debug = False' 'debug =  True' galaxy.ini
sed_replace '^#sanitize_all_html = True' 'sanitize_all_html = True' galaxy.ini

## DATA LIBRARIES
sed_replace '^#library_import_dir = None' 'library_import_dir = database/admin_upload' galaxy.ini
sed_replace '^#user_library_import_dir = None' 'user_library_import_dir = database/user_upload' galaxy.ini

## USERS / SECURITY
sed_replace '^#use_remote_user = False' 'use_remote_user = False' galaxy.ini

sed_replace '^#normalize_remote_user_email = False' 'normalize_remote_user_email = True ' galaxy.ini
sed_replace '^#admin_users =.*' "admin_users = ${GALAXY_ADMIN_USERS}" galaxy.ini

sed_replace '^#require_login = False' 'require_login = True' galaxy.ini
sed_replace '^#allow_user_creation = True' 'allow_user_creation = False' galaxy.ini
sed_replace '^#allow_user_deletion = False' 'allow_user_deletion = True' galaxy.ini
sed_replace '^#allow_user_impersonation = False' 'allow_user_impersonation = True' galaxy.ini
sed_replace '^#allow_user_dataset_purge = True' 'allow_user_dataset_purge = True' galaxy.ini
sed_replace '^#new_user_dataset_access_role_default_private = False' 'new_user_dataset_access_role_default_private = False ' galaxy.ini
sed_replace '^#expose_dataset_path = False' 'expose_dataset_path = True' galaxy.ini

## JOBS
sed_replace '^#job_config_file = config/job_conf.xml' "job_config_file = ${GALAXY_JOB_CONF}" galaxy.ini
sed_replace '^#enable_job_recovery = True' 'enable_job_recovery = True' galaxy.ini
sed_replace '^#cleanup_job = .*' 'cleanup_job = never' galaxy.ini
sed_replace '^#job_resource_params_file = config/job_resource_params_conf.xml' 'job_resource_params_file = config/job_resource_params_conf.xml' galaxy.ini


# tool_conf.xml:
if [ -f tool_conf.xml ]; then
    cp tool_conf.xml tool_conf.xml.orig-$(date "+%y-%m-%d-%H%M") 
fi
cp tool_conf.xml.sample ${GALAXYTREE}/${GALAXY_TOOL_CONF}

# job_conf.xml
if [ -f job_conf.xml ]; then
    cp  job_conf.xml job_conf.xml.orig-$(date "+%y-%m-%d-%H%M") 
fi
cp job_conf.xml.sample_basic ${GALAXYTREE}/${GALAXY_JOB_CONF}


# Uglify the new main Galaxy menu
cd ${GALAXYTREE}

echo NODEJS PATH $(which npm)
echo "WARN : Running 'make client'. If it fails or hangs, NODEJS has been moved to another directory. Read the info in the file NODEJS_UPDATE.md"

make client

echo "=== Ready configuring Galaxy. Exiting configure_galaxy.sh == "
