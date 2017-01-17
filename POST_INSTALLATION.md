# All features installed! What remains to be done:

## Editing: 

2.1. Edit job_conf.xml (Your job_resource_params_conf.xml is already configured, make sure your setup matches!)
2.2. Edit /etc/sudoers for the galaxy-gold commands (see README.md)

## Starting: 

3.1. Start munge service (sudo systemctl start munge.service)
3.2. Start Galaxy for the first time in order to setup galaxy and create .venv:

     sudo -u galaxy -H sh -c /home/galaxy/galaxy/run.sh

3.3. Fiks galaxy .venv by running .venv_config script
3.4. Start galaxy again, and see that it listens to the correct port.

## Apache httpd server and authentication

4. For installing apache httpd and setup authentication through dataporten, run
the galaxy-dataporten-deployment script

## Running:

5.1. Start galaxy again (sudo /etc/init.d/galaxyd start)
5.2. Check the log (tail -f /home/galaxy/galaxy/paster.log)

