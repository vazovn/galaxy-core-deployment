
## Initialize galaxy: 

1.1. Start Galaxy for the first time in order to setup galaxy and create .venv:

     sudo -u galaxy -H sh -c /home/galaxy/galaxy/run.sh

1.2. If galaxy is using an old database: 

1.2.1 Start galaxy again, and
1.2.2 run manage.db with galaxy user:

     sudo -iu galaxy
     cd galaxy
     ./manage_db.sh upgrade

1.2.3 Start galaxy again, and see that it listens to the correct port.

## Install Apache httpd server and set up authentication

2. For installing apache httpd and setup authentication through dataporten, run
the galaxy-dataporten-deployment script

## Run galaxy:

3.1. Start galaxy again (sudo /etc/init.d/galaxyd start)
3.2. Check the log (tail -f /home/galaxy/galaxy/paster.log)

