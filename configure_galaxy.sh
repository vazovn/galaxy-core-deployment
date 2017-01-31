#!/bin/bash

echo "Params: $1"
production=$1

# source settings
. settings.sh

MYDIR="$(dirname "$(realpath "$0")")"

cd /home/galaxy/
if [ -e "${GALAXYTREE}" ]; then
    echo ${GALAXYTREE} exists
    #exit 1
else
    git clone -b ${GALAXY_BRANCH} https://${UIOUSER}@bitbucket.usit.uio.no/scm/ft/galaxy.git
fi

function sed_replace {
    # TODO check if string contains ,
    if [ -z "$2" ]; then
        echo "Error in replacing of line $1 in $3"
        exit 1
    fi
    if grep --quiet "$1" $3; then
        sed -i -E "s%$1%$2%" $3
    echo "replaced $1 with $2"
    else
        echo "Line matching /$1/ not found in $3"
        exit 1
    fi
    }

## Customize Galaxy platform with Cluster and Project Management issues
if [ "${GALAXY_ABEL_MOUNT}" == "1" ]; then

    mkdir -p ${GALAXY_FILEPATH}     	# /work/projects/galaxy/data/database... /files
    mkdir -p ${GALAXY_NEW_FILEPATH}   # /work/projects/galaxy/data/database... /tmp
    mkdir -p ${GALAXY_JOB_WORKING_DIRECTORY} # /work/projects/galaxy/data/database... /job_working_directory
    mkdir -p ${GALAXY_CLUSTER_FILES_DIRECTORY} # /work/projects/galaxy/data/database... /slurm
    mkdir -p ${GALAXY_TOOL_DATA_PATH} # work/projects/galaxy/data/galaxy-tool-data

    ## Install Project management issues (most of them come from the lifeportal galaxy branch)
    ln -sf ${EXTERNAL_DBS_PATH} ${EXTERNAL_DBS_LINK_NAME}
    
    ## Change path to the Galaxy database (all files) directory (from local to cluster database)
    mv ${GALAXYTREE}/database ${GALAXYTREE}/database.orig-$(date "+%y-%m-%d-%H%M") 2>&1 || echo $?
    ln -s ${GALAXY_DATABASE_DIRECTORY_ON_CLUSTER} ${GALAXYTREE}/database



    # Customized environment variables file (local_env.sh)
    
    ## GOLD DB setup

    # if [ -f ${MYDIR}/local_env.sh ]; then
    cp ${MYDIR}/local_env.sh ${GALAXYTREE}/config
    if [[ -n "${GOLDDBUSER}" && -n "${GOLDDBPASSWD}" && -n "${GOLDDBHOST}" && -n "${GOLDDB}" ]]; then
        golddbstring="postgresql://${GOLDDBUSER}:${GOLDDBPASSWD}@${GOLDDBHOST}/${GOLDDB}"
        sed_replace '^export GOLDDB=.*' "export GOLDDB=${golddbstring}" ${GALAXYTREE}/config/local_env.sh
        echo "replaced db in local_env.sh"
    else
	echo "Gold db settings missing from settings.sh"
    fi
    # fi

    # job_resource_params_conf.xml :
    if [ -f ${MYDIR}/job_resource_params_conf.xml ]; then
        cp ${MYDIR}/job_resource_params_conf.xml ${GALAXYTREE}/config
    else
        echo -e "\nSomething is wrong here!!! Your job_resource_params_conf.xml is missing, copying job_resource_params_conf.xml.sample  ..."
        echo -e "Are you going to use cluster job parameters?\n"
        cp ${GALAXYTREE}/config/job_resource_params_conf.xml.sample ${GALAXYTREE}/config/job_resource_params_conf.xml
    fi
fi

if [[ ${GALAXY_TOOLS_REPO} != "none" ]]; then
    if [ -d "${GALAXYTREE}/${GALAXY_TOOL_PATH}" ]; then
        THISDIR=${PWD}
        cd ${GALAXYTREE}/${GALAXY_TOOL_PATH}
        git pull
        cd ${THISDIR}
    else
        git clone https://${GALAXY_TOOLS_REPO} ${GALAXYTREE}/${GALAXY_TOOL_PATH}
    fi
fi
if [[ ${GALAXY_TOOL_DATA_REPO} != "none" ]]; then
    if [ -d "${GALAXY_TOOL_DATA_PATH}" ]; then
        THISDIR=${PWD}
        cd ${GALAXY_TOOL_DATA_PATH}
        git pull
        cd ${THISDIR}
    else
        git clone https://${GALAXY_TOOL_DATA_REPO} ${GALAXY_TOOL_DATA_PATH}
    fi
fi

# Manage Galaxy config files

cd ${GALAXYTREE}/config

# galaxy ini:
if [ ! -f galaxy.ini ]; then
    cp galaxy.ini.sample galaxy.ini
else
    cp galaxy.ini galaxy.ini.orig-$(date "+%y-%m-%d-%H%M") 
fi

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

## DB
# sed_replace '^#database_engine_option_pool_size =.*' 'database_engine_option_pool_size = 5' galaxy.ini
# sed_replace '^#database_engine_option_max_overflow =.*' 'database_engine_option_max_overflow = 10' galaxy.ini
# sed_replace '^#database_engine_option_server_side_cursors = False' 'database_engine_option_server_side_cursors = True' galaxy.ini


## DB config
if [[ -n "${GALAXYDB}" && -n "${GALAXYDBUSER}" && -n "${GALAXYDBPASSWD}" && -n "${GALAXYDBHOST}" ]]; then
    dbstring="postgresql://${GALAXYDBUSER}:${GALAXYDBPASSWD}@${GALAXYDBHOST}/${GALAXYDB}"
    sed_replace '#database_connection.*' "database_connection = ${dbstring}" galaxy.ini
    echo "replaced db in galaxy.ini"
fi

## PATHS / DIRS
## Abel specific
if [ "${GALAXY_ABEL_MOUNT}" == "1" ]; then
    sed_replace '^#new_file_path =.*' "new_file_path = ${GALAXY_NEW_FILEPATH}" galaxy.ini
    sed_replace '^#file_path =.*' "file_path = ${GALAXY_FILEPATH}" galaxy.ini
    sed_replace '^#job_working_directory =.*' "job_working_directory =  ${GALAXY_JOB_WORKING_DIRECTORY}" galaxy.ini
    sed_replace '^#cluster_files_directory =.*' "cluster_files_directory = ${GALAXY_CLUSTER_FILES_DIRECTORY}" galaxy.ini
    sed_replace '^#collect_outputs_from =.*' 'collect_outputs_from = new_file_path,job_working_directory ' galaxy.ini
fi

## CONFS
if [ "${GALAXY_TOOL_CONF}" != "" ]; then
    sed_replace '^#tool_config_file =.*' "tool_config_file = ${GALAXY_TOOL_CONF}" galaxy.ini
fi
# sed_replace '^#integrated_tool_panel_config.*' 'integrated_tool_panel_config = integrated_tool_panel.xml' galaxy.ini
sed_replace '^#tool_data_table_config_path = config/tool_data_table_conf.xml' "tool_data_table_config_path = ${GALAXY_TOOL_DATA_TABLE_CONF}" galaxy.ini

if [ "${GALAXY_ABEL_MOUNT}" == "1" ]; then
	sed_replace '^#tool_data_path = tool-data' "tool_data_path = ${GALAXY_TOOL_DATA_PATH}" galaxy.ini
else
	sed_replace '^#tool_data_path = tool-data' "tool_data_path = ${GALAXY_TOOL_DATA_LOCAL}" galaxy.ini
fi

## TOOLS FOLDER
sed_replace '^#tool_path.*' "tool_path = ${GALAXY_TOOL_PATH}" galaxy.ini

## SMTP / EMAILS
sed_replace '^#smtp_server =.*' 'smtp_server = smtp.uio.no' galaxy.ini
sed_replace '^#error_email_to =.*' 'error_email_to = lifeportal-help@usit.uio.no' galaxy.ini

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
sed_replace '^#use_remote_user = False' 'use_remote_user = True' galaxy.ini

if [ -n "${GALAXY_LOGOUT_URL}" ]; then
    sed_replace '^#remote_user_logout_href = None' "remote_user_logout_href = ${GALAXY_LOGOUT_URL}" galaxy.ini
fi
sed_replace '^#normalize_remote_user_email = False' 'normalize_remote_user_email = True ' galaxy.ini
sed_replace '^#admin_users =.*' "admin_users = ${GALAXY_ADMIN_USERS}" galaxy.ini

if [ "${GALAXY_ABEL_MOUNT}" == "1" ]; then
    sed -i  "s/admin_users =.*/&\n## Project Admins\nproject_admin_users = ${PROJECT_ADMIN_USERS}/"  galaxy.ini
fi


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


# job_conf.xml:
if [ ! -f job_conf.xml ]; then
    cp job_conf.xml.sample_basic job_conf.xml
else
    cp job_conf.xml job_conf.xml.orig-$(date "+%y-%m-%d-%H%M") 
fi

# Uglify the new main Galaxy menu
cd ${GALAXYTREE}
make client
    
echo "Exiting configure_galaxy.sh!!"
