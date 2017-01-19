#! /bin/bash


# Modify $PYTHONPATH in .venv
sudo -u galaxy -H sh -c 'echo export GALAXY_LIB=/home/galaxy/galaxy/lib >> /home/galaxy/galaxy/.venv/bin/activate'
sudo -u galaxy -H sh -c 'echo export PYTHONPATH=\${GALAXY_LIB}:/home/galaxy/galaxy/lib/usit/python >> /home/galaxy/galaxy/.venv/bin/activate'
