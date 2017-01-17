# galaxy-core-management   

## Prerequistes

* If using data from existing galaxy and gold databases, these should be dumped
  and imported to the current databases

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
* file (.venv/bin/activate) which sets the path for the custom python packs
  (like drmaa_usit.py)


## Deploying

clone the repo to your /tmp directory and run

    ./deploy_full_procedure.sh

Follow the procedures in the script. The script will deploy the setup of the
features mentioned above. Please refer to the final requirements which will be
displayed at the end of the script execution.


#### Create a file (*only* if you *DO NOT* take the file over from a previous version)
    
    
    /work/projects/galaxy/external_dbs/project_managers.txt
	
which shall contain all the project managers. This file is called by the
controller lib/usit/python/Project_managers.py  
	
#### Edit /etc/sudoers : 

This file should be edited with *visudo*, to avoid syntax errors. Visudo uses
the editor set by the EDITOR environment variable. You can use nano this way:

    sudo EDITOR=nano visudo

add the following lines  

    Cmnd_Alias GOLD = /opt/gold/bin/*
    Defaults:galaxy !requiretty
    galaxy <HOSTNAME>=(gold) NOPASSWD: GOLD  

where <HOSTNAME> is the hostname of the server.

ATTENTION : In order to use the project management feature, GOLD shall be
running on your Galaxy instance!

