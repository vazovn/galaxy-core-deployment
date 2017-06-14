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
GALAXY_GIT_BRANCH=release_17.01
# Galaxy repository
uiouser=
GALAXY_GIT_REPO=https://github.com/galaxyproject/galaxy.git

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
GALAXY_BRAND=Lifeportal
GALAXY_PUBLIC_HOSTNAME=
GALAXY_ADMIN_USERS=
GALAXY_HELP_EMAIL=
