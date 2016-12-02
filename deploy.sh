#!/bin/bash

# source settings
. settings.sh

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

sudo -u galaxy -H sh -c as_galaxy_user.sh ${production} ${dburl}
