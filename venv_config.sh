#! /bin/bash

. settings.sh

MYDIR="$(dirname "$(realpath "$0")")"

# Modify $PYTHONPATH in .venv
sudo -u galaxy -H sh -c "echo export GALAXY_LIB=${GALAXYTREE}/lib >> ${GALAXYTREE}/.venv/bin/activate"


## This line is used to source all the python packages which you have introduced to the system
## Replace MY_PACKAGES_DIRECTORY by your own directory name, place your python packages there and uncomment
# sudo -u galaxy -H sh -c "echo export PYTHONPATH='$'GALAXY_LIB:${GALAXYTREE}/lib/MY_PACKAGES_DIRECTORY/python >> ${GALAXYTREE}/.venv/bin/activate"
