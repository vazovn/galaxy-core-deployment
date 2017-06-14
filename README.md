# galaxy-core-management   

## Prerequistes

* If using data from existing galaxy, it should be dumped
  and imported to the current database

## The script deploys:

* Galaxy framework 

## Configures 

* Galaxy main config file (galaxy.ini)
* Galaxy custom environment file (local_env.sh)
* file (.venv/bin/activate) which sets the path for the custom python packs
  (like drmaa_usit.py)


## Deploying

clone the repo to your /tmp directory and run

    ./deploy_full_procedure.sh

Follow the procedures in the script. The script will deploy the setup of the
features mentioned above. Please refer to the final requirements which will be
displayed at the end of the script execution.

## Issues

- /etc/init.d/galaxyd is not modified according to settings.sh, and may need 
  manual changes.
