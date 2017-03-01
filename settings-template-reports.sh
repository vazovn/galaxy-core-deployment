#!/bin/bash

# -------------------------------------------------------------- #
#                                                                #
#             settings for galaxy deployment script              #
#                       USIT/UiO, 2017                           #
#                                                                #
# This file contains the settings for the deployment script.     #
# Many of these options are specific for reports.ini. Please see  # 
# reports.ini.sample for description of these.                    #
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
GALAXY_GIT_BRANCH=lifeportal_17.01_reports
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

# Brand and public hostname
GALAXY_BRAND=Lifeportal-Reports
GALAXY_PUBLIC_HOSTNAME=reports-lifeportal.uio.no
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
    echo Please fill out GALAXY_DATABASE_DIRNAME in settings-reports.sh
fi

ABEL_WORK_PATH=/work/projects/galaxy/data

# Generate variables from ABEL_WORK_PATH and GALAXY_DATABASE_DIRNAME                            
# --------------------------------------------------------------------------------------------- #
GALAXY_DATABASE_DIRECTORY_ON_CLUSTER=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}               #
GALAXY_FILEPATH=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/files                              #
GALAXY_NEW_FILEPATH=${ABEL_WORK_PATH}/${GALAXY_DATABASE_DIRNAME}/tmp                            # 
# --------------------------------------------------------------------------------------------- #
