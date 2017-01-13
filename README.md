# galaxy-core-management   

## Prerequistes

* If project management is needed, GOLD must be installed: see the galaxy-gold-no-gui-installation repo.

## The script deploys:

* Galaxy framework 
* SLURM rpms
* Munge rpms
* Polish DRMAA library
* Project management module
* Customized drmaa solution

## Configures 

* Galaxy main config file (galaxy.ini)
* Galaxy job_resource_params.xml (job parameters file for the cluster)
* Galaxy custom environment file (local_env.sh)
* file (.venv/bin/activate) which sets the path for the custom python packs (like drmaa_usit.py)


## Deploying

clone the repo to your /tmp directory and run

    ./deploy_full_procedure.sh

Follow the procedures in the script. The script will deploy the setup of the features mentioned above. Please refer to the final requirements which will be displayed at the end of the script execution.


#### Create a file (*only* if you *DO NOT* take the file over from a previous version)
    
    
    /work/projects/galaxy/external_dbs/project_managers.txt
	
which shall contain all the project managers. This file is called by the controller lib/usit/python/Project_managers.py  
	
#### Edit /etc/sudoers : 

add the following lines  

    Cmnd_Alias GOLD = /opt/gold/bin/*
    Defaults:galaxy !requiretty
    galaxy <HOSTNAME>=(gold) NOPASSWD: GOLD  

and edit the *hostname* to match your hostname's name

ATTENTION : In order to use the project management feature, GOLD shall be running your Galaxy instance!!
