#! /bin/bash

. settings-reports.sh

# psycopg2 is missing from the requirements for the reports server
sudo -u galaxy -H sh -c "${GALAXYTREE}/.venv/bin/pip install --extra-index-url http://wheels.galaxyproject.org/ psycopg2"

sudo -u galaxy -H sh -c "echo export GALAXY_LIB=${GALAXYTREE}/lib >> ${GALAXYTREE}/.venv/bin/activate"
sudo -u galaxy -H sh -c "echo export PYTHONPATH='$'GALAXY_LIB:${GALAXYTREE}/lib/usit/python >> ${GALAXYTREE}/.venv/bin/activate"
