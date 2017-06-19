# All commands shall be executed as root (sudo)

    user : gcc2017
    passwd (also sudo) : galaxy2017

## Uninstall Apache: 

    apachectl stop
    yum erase httpd*

## Uninstal Postgresql 

    systemctl stop postgresql-9.4.service
    cd /var/lib
    rm -rf pgsql
    nano /etc/yum.repo.d.CentOS-Base.repo and delete line "exclude=postgresql*"

## Uninstall Galaxy

    cd /home
    rm -rf galaxy
    nano /etc/passwd and delete row containing user 'galaxy'
    rm /etc/profile.d/z_galaxyprompt.sh

## Then you can launch the installaiton script again
