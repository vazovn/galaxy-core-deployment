#!/bin/bash

# -------------------------------------------------------------- #
#                                                                #
#             settings for galaxy deployment script              #
#                       USIT/UiO, 2017                           #
#                                                                #
# This file contains the settings for the deployment script.     #
# Many of these options are specific for galaxy.ini. Please see  # 
# galaxy.ini.sample for description of these.                    #
#                                                                #
# -------------------------------------------------------------- #

# Exit on all errors
error() {
    local sourcefile=$1
    local lineno=$2
    echo "Error on line ${lineno} in ${sourcefile}"
    exit 1
}
trap 'error "${BASH_SOURCE}" "${LINENO}"' ERR
# To ignore error from command, append this to command:
## 2>&1 || echo $?


# General settings
# ---------------- 

# Galaxy version (branch)
GALAXY_GIT_BRANCH=release_17.05
# Galaxy repository
GALAXY_GIT_REPO=https://github.com/galaxyproject/galaxy.git

# Galaxy user (for /etc/passwd)
GALAXYUSER=galaxy
GALAXYGROUP=galaxy
GALAXYUSERUID=1001
GALAXYUSERGID=1001
GALAXYUSERHOME=/home/galaxy
GALAXYTREE=/home/galaxy/galaxy

# Galaxy DB
# If left empty, local sqlite3 is used:
GALAXYDB=galaxydb1
GALAXYDBUSER=galaxydb1_user
GALAXYDBPASSWD=12345
GALAXYDBHOST=127.0.0.1:5432

# Config files
# Set to SKIP for skipping change
# ------------------------------------------

## config/tool_conf.xml
GALAXY_TOOL_CONF=config/tool_conf.xml
## config/job_conf.xml
GALAXY_JOB_CONF=config/job_conf.xml
## config/tool_data_table_conf.xml
GALAXY_TOOL_DATA_TABLE_CONF=config/tool_data_table_conf.xml
GALAXY_DATATYPES_CONF=SKIP


## Toolshed files
GALAXY_DATA_MANAGER_CONF=config/data_manager_conf.xml
GALAXY_SHED_TOOL_CONF=config/shed_tool_conf.xml
GALAXY_SHED_TOOL_DATA_TABLE_CONF=config/shed_tool_data_table_conf.xml
GALAXY_SHED_DATA_MANAGER_CONF=config/shed_data_manager_conf.xml

# Tools and tools_data folder
GALAXY_TOOL_PATH=${GALAXYTREE}/tools
GALAXY_TOOL_DATA_LOCAL=${GALAXYTREE}/tool_data


# Galaxy.ini settings in configure_galaxy.sh
# Set to SKIP for skipping change
# ------------------------------------------

# Brand and public hostname
GALAXY_BRAND=MyFirstGalaxy
GALAXY_ADMIN_USERS=admin@admin.com,n.a.vazov@usit.uio.no
GALAXY_HELP_EMAIL=n.a.vazov@usit.uio.no
