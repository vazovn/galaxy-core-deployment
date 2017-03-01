
## Initialize galaxy: 

3.1. Start munge service (sudo systemctl start munge.service)
3.2. Start Galaxy for the first time in order to setup galaxy and create .venv:

     sudo -u galaxy -H sh -c /home/galaxy/galaxy/run_reports.sh

3.3. Fix galaxy .venv by running .venv_config_reports script

3.4. If galaxy is using an old database:
 
     3.4.1 Start galaxy again, and
     
     3.4.2 run manage.db with galaxy user:

     sudo -iu galaxy
     cd galaxy
     ./manage_db.sh upgrade

3.5. Start galaxy again, and see that it listens to the correct port.

## Install Apache httpd server and set up authentication

4. For installing apache httpd and setup authentication through dataporten, run
the galaxy-dataporten-deployment script

## Run galaxy:

5.1. Start galaxy again (sudo /etc/init.d/reports_galaxyd start)

5.2. Check the log (tail -f /home/galaxy/galaxy/paster.log)

