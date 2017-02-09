#! /bin/bash

. settings.sh

MYDIR="$(dirname "$(realpath "$0")")"

# Modify $PYTHONPATH in .venv
sudo -u galaxy -H sh -c 'echo export GALAXY_LIB=/home/galaxy/galaxy/lib >> /home/galaxy/galaxy/.venv/bin/activate'
sudo -u galaxy -H sh -c 'echo export PYTHONPATH=\${GALAXY_LIB}:/home/galaxy/galaxy/lib/usit/python >> /home/galaxy/galaxy/.venv/bin/activate'

read -p "Install module for project report generation (PDF)? [yN] " installpdfreport

if [ "${installpdfreport}" == "y" ]; then
    # Deploy PDF modules needed to print the pdf reports
    sudo -u galaxy -H sh -c "${MYDIR}/deploy-pdf-modules.sh"
fi
