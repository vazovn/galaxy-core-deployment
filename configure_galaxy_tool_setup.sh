#!/bin/bash

# source settings
. settings.sh


MYDIR="$(dirname "$(realpath "$0")")"

function sed_replace {
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

cp -rf ${MYDIR}/data $GALAXYUSERHOME
cp -rf ${MYDIR}/genomes $GALAXYUSERHOME
cp -rf ${MYDIR}/mytools $GALAXYUSERHOME

# Manage Galaxy config files

cd ${GALAXYTREE}/config


## Edit galaxy.ini

sed_replace '^library_import_dir = .*' 'library_import_dir = /home/galaxy/data/' galaxy.ini
sed_replace '#allow_library_path_paste = .*' 'allow_library_path_paste = True' galaxy.ini

## Just in case, explain
sed_replace '^allow_user_impersonation = .*' '#allow_user_impersonation = True' galaxy.ini
sed_replace '^allow_user_dataset_purge = .*' '#allow_user_dataset_purge = True' galaxy.ini

sed_replace '^#galaxy_data_manager_data_path = .*'  'galaxy_data_manager_data_path = /home/galaxy/genomes/' galaxy.ini

sed_replace '^#data_manager_config_file = .*' "data_manager_config_file = ${GALAXY_DATA_MANAGER_CONF}" galaxy.ini
sed_replace '^tool_config_file = .*' "&,${GALAXY_SHED_TOOL_CONF}" galaxy.ini
sed_replace '^#shed_tool_data_table_config = .*' "shed_tool_data_table_config = ${GALAXY_SHED_TOOL_DATA_TABLE_CONF}" galaxy.ini
sed_replace '^#shed_data_manager_config_file = .*' "shed_data_manager_config_file = ${GALAXY_SHED_DATA_MANAGER_CONF}" galaxy.ini

sed_replace '^#conda_prefix = .*' 'conda_prefix = /home/galaxy/_conda' galaxy.ini
sed_replace '^#conda_auto_install = .*' 'conda_auto_install = True' galaxy.ini
sed_replace '^#conda_auto_init = .*' 'conda_auto_init = True' galaxy.ini

echo -e "\n\n==============================================================================================="
echo -e "======================    Ready configuring Galaxy Tool Setup  ================================"
echo -e "===============================================================================================\n\n"

