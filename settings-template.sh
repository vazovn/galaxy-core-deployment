#!/bin/bash

# exit on all errors
error() {
    local sourcefile=$1
    local lineno=$2
    echo "Error on line ${lineno} in ${sourcefile}"
    exit 1
}
trap 'error "${BASH_SOURCE}" "${LINENO}"' ERR
# To ignore error from command, append this to command:
## 2>&1 || echo $?

# Must be specified:
UIOUSER=

GALAXYUSER=galaxy
GALAXYUSERPID=182649
GALAXYUSERGID=70731
GALAXYUSERHOME=/home/galaxy
GALAXYTREE=/home/galaxy/galaxy

# Galaxy version (branch)
GALAXY_BRANCH=lifeportal_16.10

# Galaxy DB
# Must be specified:
GALAXYDB=
GALAXYDBUSER=
GALAXYDBPASSWD=
GALAXYDBHOST=

# Config file names
GALAXY_TOOL_CONF=config/tool_conf.xml.lifeportal
GALAXY_JOB_CONF=config/job_conf.xml.lifeportal
GALAXY_TOOL_DATA_TABLE_CONF=config/tool_data_table_conf.xml.lifeportal

# Tools and tools_data folder
GALAXY_TOOL_PATH=tools_lifeportal
GALAXY_TOOL_DATA_LOCAL=tool_data_lifeportal

# Tools and tools_data repository (set to "none", to not use this)
GALAXY_TOOLS_REPO=${UIOUSER}@bitbucket.usit.uio.no/scm/ft/lifeportal_tool_config.git
GALAXY_TOOL_DATA_REPO=${UIOUSER}@bitbucket.usit.uio.no/scm/ft/lifeportal_tool_data.git

# Brand and public hostname
GALAXY_BRAND=Lifeportal
GALAXY_PUBLIC_HOSTNAME=lifeportal.uio.no
GALAXY_ADMIN_USERS=n.a.vazov@usit.uio.no,sabry.razick@usit.uio.no,trond.thorbjornsen@usit.uio.no

# ==== The rest of the file is only needed when abel is mounted !!

# Will this server have abel mounted:
GALAXY_ABEL_MOUNT=1

# Example: GALAXY_DATABASE_DIRNAME=database_galaxy_prod01
# Must be set, when abel is mounted:
GALAXY_DATABASE_DIRNAME=
if [ -z ${GALAXY_DATABASE_DIRNAME} ]; then
    echo Please fill out GALAXY_DATABASE_DIRNAME in settings.sh
fi

### <-- Generated
ABEL_WORK_PATH=/work/projects/galaxy/data
GALAXY_DATABASE_DIRECTORY_ON_CLUSTER=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}
GALAXY_FILEPATH=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/files
GALAXY_NEW_FILEPATH=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/tmp
GALAXY_JOB_WORKING_DIRECTORY=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/job_working_directory
GALAXY_CLUSTER_FILES_DIRECTORY=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/slurm
GALAXY_TOOL_DATA_PATH=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/${GALAXY_TOOL_DATA_LOCAL}
### -->

EXTERNAL_DBS_LINK_NAME=/home/galaxy/galaxy/lib/usit/external_dbs
EXTERNAL_DBS_PATH=/work/projects/galaxy/external_dbs

# Project admins
PROJECT_ADMIN_USERS=n.a.vazov@usit.uio.no,sabry.razick@usit.uio.no,trond.thorbjornsen@usit.uio.no

# GOLD settings

GOLD_SRC_DIRECTORY=gold-2.2.0.5
GOLD_INSTALLATION_DIRECTORY=/opt

# Must be set, when GOLD is used:
GOLDDB=
GOLDDBUSER=
GOLDDBPASSWD=
GOLDDBHOST=

