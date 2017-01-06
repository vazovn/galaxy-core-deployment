### ENVIROMENT VARIABLES FOR GALAXY ### 
## accessed as e.g.:
## if "GOLDDB" in os.environ.keys() :


### The PYTHONPATH is set in .venv/bin/activate
### If not using vurtualenv, activate the line below
#export PYTHONPATH=/home/galaxy/usit_galaxy/lib/usit/python:$PYTHONPATH

# location of slurm_drmaa.conf file
export SLURM_DRMAA_CONF=/etc/slurm_drmaa.conf
echo "SLURM_DRMAA_CONF : " $SLURM_DRMAA_CONF

export DRMAA_LIBRARY_PATH=/site/drmaa/lib/libdrmaa.so.1.0.6
echo "DRMAA_LIBRARY_PATH : " $DRMAA_LIBRARY_PATH

### If not using vurtualenv, activate the line below
#export GALAXY_LIB="/home/galaxy/usit_galaxy/lib"
#echo "GALAXY_LIB : " $GALAXY_LIB

### Gold Database ###
### Used by drmaa_usit.py, Accounting_jobs.py, Accounting_project_management.py
export GOLDDB="postgresql://USER:PASSWORD@dbpg-abel.uio.no/DBNAME"
echo "GOLDDB : " $GOLDDB

## Lifeportal project ID
## Normally defined in job_conf.xml in the destination string. 
## This value will override the default one in job_conf.xml
export LP_PROJECT_ID="<NOTUR_PROJECT_ID>"
echo "LP_PROJECT_ID: " $LP_PROJECT_ID
