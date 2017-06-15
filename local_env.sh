### ENVIROMENT VARIABLES FOR GALAXY ### 
## accessed as e.g.:
## if "GOLDDB" in os.environ.keys() :


### The PYTHONPATH is set in .venv/bin/activate
### If not using vurtualenv, activate the line below
#export PYTHONPATH=/home/galaxy/usit_galaxy/lib/usit/python:$PYTHONPATH

### If not using vurtualenv, activate the line below
#export GALAXY_LIB="/home/galaxy/usit_galaxy/lib"
#echo "GALAXY_LIB : " $GALAXY_LIB

## Galaxy home containing Galaxy root
export GALAXY_HOME="<GALAXYUSERHOME>"
echo "GALAXY_HOME: " $GALAXY_HOME
