#!/bin/bash

UIOUSER=tt   
GALAXYUSER=galaxy
GALAXYUSERPID=182649
GALAXYUSERGID=70731
GALAXYUSERHOME=/home/galaxy
GALAXYTREE=/home/galaxy/galaxy

# db
read -p "Database url on the form: postgresql://username:password@localhost/mydatabase (leave empty for local sqlite)" dburl

# setup
if [ "$1" == "production" ]; then
    production=y
else
    read -p "Is this a production server? [yN]" production
fi


sudo sh -c 'echo galaxy:x:182649:70731:galaxy:/home/galaxy:/bin/bash >> /etc/passwd'
sudo mkdir /home/galaxy
sudo chown galaxy:galaxy /home/galaxy/
sudo yum install git
sudo -i -u galaxy 
cd /home/galaxy/
if [ -e ${GALAXYTREE} ]; then
    echo ${GALAXYTREE} exists
    exit 1
fi
git clone https://${UIOUSER}@bitbucket.usit.uio.no/scm/ft/galaxy.git

function sed_replace {
    if grep --quiet "$1" $3; then
        sed -i -E "s/$1/$2/" $3
    else
        echo "Line matching /$1/ not found in $3"
        exit 1
    fi
    }

# galaxy ini:
cd ${GALAXYTREE}/config
if [ ! -f galaxy.ini ]; then
    cp galaxy.ini.sample galaxy.ini
else
    cp galaxy.ini galaxy.ini.orig-$(date "+%y-%m-%d-%H%M") 
fi
# disable debug and use_interactive for production
case ${production} in
    [Yy]* )
        sed_replace '^#debug = False' 'debug =  False/' galaxy.ini
        sed_replace '^use_interactive = True' 'use_interactive = False' galaxy.ini
    ;;
esac

if [ ! -z ${dburl} ]; then
    sed_replace '#database_connection' "${dburl}" galaxy.ini
