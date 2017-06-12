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
export GOLDDB="postgresql://GOLDUSER:GOLDPASSWORD@GOLDHOST/GOLDDBNAME"
echo "GOLDDB : " $GOLDDB

## Lifeportal project ID
## Normally defined in job_conf.xml in the destination string. 
## This value will override the default one in job_conf.xml
export LP_PROJECT_ID="<NOTUR_PROJECT_ID>"
echo "LP_PROJECT_ID: " $LP_PROJECT_ID

## used in lib/galaxy/web/base/controllers/project_admin.py
export PDF_REPORTS_DIRECTORY="/work/projects/galaxy/PDF_reports/"
echo "PDF_REPORTS_DIRECTORY : " $PDF_REPORTS_DIRECTORY 

## Galaxy home containing Galaxy root
export GALAXY_HOME="<GALAXYUSERHOME>"
echo "GALAXY_HOME: " $GALAXY_HOME

## FILESENDER ##

## used in /home/galaxy/galaxy/lib/usit/python/Filesender.py
export FILESENDERDB="postgresql://FILESENDERUSER:FILESENDERPASSWORD@FILESENDERHOST/FILESENDERDBNAME"
echo "FILESENDERDB : " $FILESENDERDB

## Filesender directory
export FILESENDER_STORAGE="<FILESENDER_STORAGE_PATH>"
echo "FILESENDER_STORAGE : " $FILESENDER_STORAGE 
