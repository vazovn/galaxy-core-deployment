# galaxy-core-management   


## Login credentials

* username : gcc2017
* password : galaxy2017

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

For a clean start (if you already have galaxy-core-deployment code) :

    cd <DIRECTORY-WITH-THE-CODE>
    rm -rf galaxy-core-deployment

clone the repo to your /home directory (in our case /home/gcc2017)

    git clone -b gcc2017 https:/github.com/vazovn/galaxy-core-deployment.git

and run

    ./deploy_full_procedure.sh

Follow the procedures in the script. The script will deploy the setup of the
features mentioned above. Please refer to the final requirements which will be
displayed at the end of the script execution.


for tool setup, stop galaxy and run 

    ./deploy_toll_setup.sh

  
## Reading (guidelines how to proceed with a production site, aknowledgements to Hans-Rudolf Hotz and Bjoern Gruening)

https://galaxyproject.org/admin/ten-simple-steps-galaxy-as-a-service/
