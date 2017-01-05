#! /bin/bash

# Modify $PYTHONPATH in .venv
echo 'export GALAXY_LIB=/home/galaxy/galaxy/lib' >> /home/galaxy/galaxy/.venv/bin/activate
echo 'export PYTHONPATH=$GALAXY_LIB:/home/galaxy/galaxy/lib/usit/python' >> /home/galaxy/galaxy/.venv/bin/activate
echo "PYTHONPATH SET IN .venv/bin/activate " $PYTHONPATH 
