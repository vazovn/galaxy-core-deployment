# galaxy-core-management   

## Prerequistes

* Git (sudo yum install git)

## The script deploys (on CentOS7 or RHEL7):

* Postgresql server (9.4 in the example but can be configured for any version)
* Apache server
* Galaxy framework 

## Configures 

* Postgresql server
* Apache server
* Galaxy main config file (galaxy.ini)
* Galaxy custom environment file (local_env.sh)


## Deploying

clone the repo to your /tmp directory and run

    ./deploy_full_procedure.sh

Follow the procedures in the script. The script will deploy the setup of the
features mentioned above. Please refer to the final requirements which will be
displayed at the end of the script execution.

## Issues

- /etc/init.d/galaxyd is not modified according to settings.sh, and may need 
  manual changes.
  
## Reading (guidelines how to proceed with a production site)

https://galaxyproject.org/admin/ten-simple-steps-galaxy-as-a-service/
