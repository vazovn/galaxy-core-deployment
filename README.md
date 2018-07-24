# galaxy-core-management   


## Login credentials

* username : galaxy
* password : galaxy2018
* dbname : galaxydb

## Prerequistes

* Git (sudo yum install git)

## The script deploys (on CentOS7 or RHEL7):

* Postgresql server (9.6 in the example but can be configured for any version)

## Configures 

* Postgresql server

## WARNING :

* When installing Postgres server

    select "hostname" for hostname in the SSL routine

* When logging into the server 

   psql -U galaxy -h 127.0.0.1 -d galaxydb -W
