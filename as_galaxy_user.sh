#!/bin/bash

echo "Params: $1, $2"
production=$1
dburl=$2

# source settings
. settings.sh

cd /home/galaxy/
if [ -e "${GALAXYTREE}" ]; then
    echo ${GALAXYTREE} exists
    #exit 1
else
    git clone https://${UIOUSER}@bitbucket.usit.uio.no/scm/ft/galaxy.git
    git checkout ${GALAXY_BRANCH}
fi

function sed_replace {
    # TODO check if string contains ,
    if grep --quiet "$1" $3; then
        sed -i -E "s,$1,$2," $3
	echo "replaced $1 with $2"
    else
        echo "Line matching /$1/ not found in $3"
        exit 1
    fi
    }


# galaxy ini:
echo "check if galaxy.ini exists"
cd ${GALAXYTREE}/config
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

echo ${dburl}

if [ ! -z ${dburl} ]; then
    sed_replace '#database_connection.*' "database_connection = ${dburl}" galaxy.ini
    echo "replaced dburl from galaxy.ini"
fi

# Fra Nikolay
sed_replace '^#admin_users.*' 'admin_users = ' galaxy.ini

## General
sed_replace '^#port =.*' 'port = 8080' galaxy.ini
sed_replace '^#host =.*' 'host = 127.0.0.1' galaxy.ini

## DB
sed_replace '^#database_engine_option_pool_size =.*' 'database_engine_option_pool_size = 5' galaxy.ini
sed_replace '^#database_engine_option_max_overflow =.*' 'database_engine_option_max_overflow = 10' galaxy.ini
sed_replace '^#database_engine_option_server_side_cursors = False' 'database_engine_option_server_side_cursors = True' galaxy.ini

## PATHS / DIRS
## Abel specific
if [ "${GALAXY_ABEL_MOUNT}" == "1" ]; then
    sed_replace '^#new_file_path =.*' 'new_file_path = ${GALAXY_NEW_FILEPATH}' galaxy.ini
    sed_replace '^#file_path =.*' 'file_path =${GALAXY_FILEPATH} ' galaxy.ini
    sed_replace '^#job_working_directory =.*' 'job_working_directory =  ${GALAXY_JOB_WORKING_DIRECTORY}' galaxy.ini
    sed_replace '^#cluster_files_directory =.*' 'cluster_files_directory = ${GALAXY_CLUSTER_FILES_DIRECTORY} ' galaxy.ini
    sed_replace '^#collect_outputs_from =.*' 'collect_outputs_from = new_file_path,job_working_directory ' galaxy.ini
fi

## CONFS
sed_replace '^#tool_config_file =.*' 'tool_config_file = config/tool_conf.xml' galaxy.ini
sed_replace '^#integrated_tool_panel_config.*' 'integrated_tool_panel_config = integrated_tool_panel.xml' galaxy.ini
sed_replace '^#tool_data_table_config_path = config/tool_data_table_conf.xml' 'tool_data_table_config_path = config/tool_data_table_conf.xml' galaxy.ini
sed_replace '^#tool_data_path = tool-data' 'tool_data_path = tool-data' galaxy.ini


## SMTP / EMAILS
sed_replace '^#smtp_server =.*' ' smtp_server = smtp.uio.no' galaxy.ini
sed_replace '^#error_email_to =.*' ' error_email_to = lifeportal-help@usit.uio.no' galaxy.ini
sed_replace '^#blacklist_file = config/disposable_email_blacklist.conf ' 'blacklist_file = config/disposable_email_blacklist.conf ' galaxy.ini

## BRAND
sed_replace '^#brand = None' 'brand = ${GALAXY_BRAND}' galaxy.ini

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
sed_replace '^#remote_user_logout_href = None' 'remote_user_logout_href = https://${GALAXY_PUBLIC_HOSTNAME}/callback?logout=http://${GALAXY_PUBLIC_HOSTNAME}/' galaxy.ini
sed_replace '^#normalize_remote_user_email = False ' 'normalize_remote_user_email = True ' galaxy.ini
sed_replace '^#admin_users = None' 'admin_users = ${GALAXY_ADMIN_USERS}' galaxy.ini
sed_replace '^#require_login = False' 'require_login = True' galaxy.ini
sed_replace '^#allow_user_creation = True' 'allow_user_creation = False' galaxy.ini
sed_replace '^#allow_user_deletion = False' 'allow_user_deletion = True' galaxy.ini
sed_replace '^#allow_user_impersonation = False' 'allow_user_impersonation = True' galaxy.ini
sed_replace '^#allow_user_dataset_purge = True' 'allow_user_dataset_purge = True' galaxy.ini
sed_replace '^#new_user_dataset_access_role_default_private = False' 'new_user_dataset_access_role_default_private = False ' galaxy.ini
sed_replace '^#expose_dataset_path = False ' 'expose_dataset_path = True' galaxy.ini

## JOBS
sed_replace '^#job_config_file = config/job_conf.xml ' 'job_config_file = config/job_conf.xml' galaxy.ini
sed_replace '^#enable_job_recovery = True' 'enable_job_recovery = True' galaxy.ini
sed_replace '^#cleanup_job = .*' 'cleanup_job = never' galaxy.ini
sed_replace '^#job_resource_params_file = config/job_resource_params_conf.xml' 'job_resource_params_file = config/job_resource_params_conf.xml' galaxy.ini

