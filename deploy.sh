#!/bin/bash

# source settings
if [ ! -f "settings.sh" ]; then
    echo Please fill in the variables in the file settings.sh
    cp settings-template.sh settings.sh
    exit 1
fi

. settings.sh

if [ ! -z "${UIOUSER}" ]; then
    echo settings.sh is not complete
fi

MYDIR="$(dirname "$(realpath "$0")")"
echo ${MYDIR}

# db
read -p "Database url on the form: postgresql://username:password@localhost/mydatabase (leave empty for local sqlite)\n> " dburl

# setup
if [ "$1" == "production" ]; then
    production=y
else
    read -p "Is this a production server? [yN] " production
fi

read -p "Mount /work on abel (host needs to be added to nfs on abel first)? [yN] " workonabel

sudo sh -c 'echo galaxy:x:182649:70731:galaxy:/home/galaxy:/bin/bash >> /etc/passwd'
sudo mkdir /home/galaxy
sudo chown galaxy:galaxy /home/galaxy/
sudo yum install git

sudo sed -i.orig-$(date "+%y-%m-%d-%H%M") -e "\$a# For /work/projects/galaxy\nadmin.abel.uio.no:/work    /work    nfs4    defaults    0 0" /etc/fstab

sudo -u galaxy -H sh -c "${MYDIR}/as_galaxy_user.sh ${production} ${dburl}"
