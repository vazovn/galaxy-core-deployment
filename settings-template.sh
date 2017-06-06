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
GALAXY_GIT_BRANCH=lifeportal_16.10
# Galaxy repository
uiouser=
GALAXY_GIT_REPO=https://${uiouser}@bitbucket.usit.uio.no/scm/ft/galaxy.git

# Galaxy user (for /etc/passwd)
GALAXYUSER=galaxy
GALAXYGROUP=galaxy
GALAXYUSERUID=182649
GALAXYUSERGID=70731
GALAXYUSERHOME=/home/galaxy
GALAXYTREE=/home/galaxy/galaxy

# Galaxy DB
# If left empty, local sqlite3 is used:
GALAXYDB=
GALAXYDBUSER=
GALAXYDBPASSWD=
GALAXYDBHOST=


# Galaxy.ini settings in configure_galaxy.sh
# Set to SKIP for skipping change
# ------------------------------------------

# Config file names
GALAXY_TOOL_CONF=config/tool_conf.xml.lifeportal
GALAXY_JOB_CONF=config/job_conf.xml.lifeportal
GALAXY_TOOL_DATA_TABLE_CONF=config/tool_data_table_conf.xml.lifeportal
GALAXY_DATATYPES_CONF=SKIP

# Tools and tools_data folder
GALAXY_TOOL_PATH=${GALAXYUSERHOME}/tools_lifeportal
GALAXY_TOOL_DATA_LOCAL=tool_data_lifeportal

# Tools and tools_data repository (set to "SKIP", to not use this)
GALAXY_TOOLS_REPO=https://${uiouser}@bitbucket.usit.uio.no/scm/ft/lifeportal_tool_config.git
GALAXY_TOOL_DATA_REPO=https://${uiouser}@bitbucket.usit.uio.no/scm/ft/lifeportal_tool_data.git

# Brand and public hostname
GALAXY_BRAND=Lifeportal
GALAXY_PUBLIC_HOSTNAME=lifeportal.uio.no
GALAXY_ADMIN_USERS=n.a.vazov@usit.uio.no,sabry.razick@usit.uio.no,trond.thorbjornsen@usit.uio.no
GALAXY_HELP_EMAIL=lifeportal-help@usit.uio.no

# When using remote authentication, this shall be set
GALAXY_LOGOUT_URL=https://${GALAXY_PUBLIC_HOSTNAME}/callback?logout=https://${GALAXY_PUBLIC_HOSTNAME}/logout


# The rest of the file is only needed when abel is mounted
# --------------------------------------------------------

# Will this server have abel mounted:
GALAXY_ABEL_MOUNT=1

# Example: GALAXY_DATABASE_DIRNAME=database_galaxy_prod01
# Must be set, when abel is mounted:
GALAXY_DATABASE_DIRNAME=

if [[ ${GALAXY_ABEL_MOUNT} != 1 ]] && [ -z ${GALAXY_DATABASE_DIRNAME} ]; then
    echo Please fill out GALAXY_DATABASE_DIRNAME in settings.sh
fi

ABEL_WORK_PATH=/work/projects/galaxy/data

# Generate variables from ABEL_WORK_PATH and GALAXY_DATABASE_DIRNAME                            
# --------------------------------------------------------------------------------------------- #
GALAXY_DATABASE_DIRECTORY_ON_CLUSTER=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}               #
GALAXY_FILEPATH=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/files                              #
GALAXY_NEW_FILEPATH=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/tmp                            # 
GALAXY_JOB_WORKING_DIRECTORY=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/job_working_directory #
GALAXY_CLUSTER_FILES_DIRECTORY=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/slurm               #
GALAXY_TOOL_DATA_PATH=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/${GALAXY_TOOL_DATA_LOCAL}    #
# --------------------------------------------------------------------------------------------- #

EXTERNAL_DBS_LINK_NAME=/home/galaxy/galaxy/lib/usit/external_dbs
EXTERNAL_DBS_PATH=/work/projects/galaxy/external_dbs


# Project admins
# --------------
PROJECT_ADMIN_USERS=n.a.vazov@usit.uio.no,sabry.razick@usit.uio.no,trond.thorbjornsen@usit.uio.no


# GOLD settings
# -------------

GOLD_SRC_DIRECTORY=gold-2.2.0.5
GOLD_INSTALLATION_DIRECTORY=/opt

# Must be set, when GOLD is used:
GOLDDB=
GOLDDBUSER=
GOLDDBPASSWD=
GOLDDBHOST=

# FILESENDER settings (Fill in if the "big file upload" option is enabled)
# -------------

# Must be set, when FILESENDER is used:
FILESENDERDBNAME=
FILESENDERUSER=
FILESENDERPASSWORD=
FILESENDERHOST=

ABEL_FILESENDER_PATH=/work/projects/galaxy/filesender
FILESENDER_STORAGE=${ABEL_FILESENDER_PATH}/${GALAXY_PUBLIC_HOSTNAME}
FILESENDER_URL=filesender.${GALAXY_PUBLIC_HOSTNAME}
SIMPLESAMLPHP_VERSION=
ABEL_SIMPLESAML_PATH=/work/projects/galaxy/simplesaml
FILESENDER_SIMPLESAML=${ABEL_SIMPLESAML_PATH}/${GALAXY_PUBLIC_HOSTNAME}


## Certificates must be provided for the domain FILESENDER_URL
## Could be a multi-domain certificate (galaxy + filesender) or only for filesender's virt host
FILESENDER_SSL_CERTIFICATE_PATH=
FILESENDER_SSL_KEYFILE_PATH=
