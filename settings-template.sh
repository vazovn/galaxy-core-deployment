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

UIOUSER=
GALAXYUSER=galaxy
GALAXYUSERPID=182649
GALAXYUSERGID=70731
GALAXYUSERHOME=/home/galaxy
GALAXYTREE=/home/galaxy/galaxy

# Galaxy version (branch)
GALAXY_BRANCH=lifeportal_16.10

# Galaxy DB
GALAXYDB=
GALAXYDBUSER=
GALAXYDBPASSWD=
GALAXYDBHOST=

# Config file names
GALAXY_TOOL_CONF=config/tool_conf.xml

GALAXY_BRAND=Lifeportal
GALAXY_PUBLIC_HOSTNAME=lifeportal.uio.no
GALAXY_ADMIN_USERS=n.a.vazov@usit.uio.no,sabry.razick@usit.uio.no,trond.thorbjornsen@usit.uio.no


# ==== The rest of the file is only needed when abel is mounted !!

GALAXY_ABEL_MOUNT=1

# Example: GALAXY_DATABASE_DIRNAME=database_galaxy_prod01
GALAXY_DATABASE_DIRNAME=
if [ -z ${GALAXY_DATABASE_DIRNAME} ]; then
    echo Please fill out GALAXY_DATABASE_DIRNAME in settings.sh
fi

GALAXY_DATABASE_DIRECTORY_ON_CLUSTER=/work/projects/galaxy/data/${GALAXY_DATABASE_DIRNAME}
GALAXY_FILEPATH=/work/projects/galaxy/data/${GALAXY_DATABASE_DIRNAME}/files
GALAXY_NEW_FILEPATH=/work/projects/galaxy/data/${GALAXY_DATABASE_DIRNAME}/tmp
GALAXY_JOB_WORKING_DIRECTORY=/work/projects/galaxy/data/${GALAXY_DATABASE_DIRNAME}/job_working_directory
GALAXY_CLUSTER_FILES_DIRECTORY=/work/projects/galaxy/data/${GALAXY_DATABASE_DIRNAME}/slurm

# Example : TOOL_DATA_PATH =/work/projects/galaxy/data/${GALAXY_DATABASE_DIRNAME}/galaxy_tool_data
GALAXY_TOOL_DATA_PATH =/work/projects/galaxy/data/${GALAXY_DATABASE_DIRNAME}

EXTERNAL_DBS_LINK_NAME=/home/galaxy/galaxy/lib/usit/external_dbs
EXTERNAL_DBS_PATH=/work/projects/galaxy/external_dbs

# Project admins
PROJECT_ADMIN_USERS=n.a.vazov@usit.uio.no,sabry.razick@usit.uio.no,trond.thorbjornsen@usit.uio.no

# GOLD issues

GOLD_SRC_DIRECTORY=gold-2.2.0.5
GOLD_INSTALLATION_DIRECTORY=/opt

GOLDDB=
GOLDDBUSER=
GOLDDBPASSWD=
GOLDDBHOST=






