
## This routine describes the steps to uninstall a failed setup carried out by 

    deploy_full_procedure.sh

(_uninstall_all.sh_ in this repo does the procedure automatically)

## All commands shall be executed as root (sudo)

    user : gcc2017
    passwd (also sudo) : galaxy2017

## Uninstall Apache: 

    apachectl stop
    yum erase httpd*

## Uninstal Postgresql 

    systemctl stop postgresql-9.4.service
    yum erase postgresql94*
    cd /var/lib
    rm -rf pgsql
    nano /etc/yum.repo.d.CentOS-Base.repo and delete line "exclude=postgresql*"

## Uninstall Galaxy

    cd /home
    rm -rf galaxy
    nano /etc/passwd and delete row containing user 'galaxy'
    nano /etc/group and delete row containing group 'galaxy'
    rm /etc/profile.d/z_galaxyprompt.sh

## Then you can launch the installation script again
