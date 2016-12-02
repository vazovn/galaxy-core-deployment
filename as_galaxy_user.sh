#!/bin/bash

echo "Params: $1, $2"
production=$1
dburl=$2

# source settings
. settings.sh

cd /home/galaxy/
if [ -e ${GALAXYTREE} ]; then
    echo ${GALAXYTREE} exists
    #exit 1
else
    git clone https://${UIOUSER}@bitbucket.usit.uio.no/scm/ft/galaxy.git
fi

function sed_replace {
    # TODO check if string contains ,
    if grep --quiet "$1" $3; then
        sed -i -E "s,$1,$2," $3
	echo "replaced $1 with $2"
    else
        echo "Line matching /$1/ not found in $3"
        exit 1
    fi
    }


# galaxy ini:
echo "check if galaxy.ini exists"
cd ${GALAXYTREE}/config
if [ ! -f galaxy.ini ]; then
    cp galaxy.ini.sample galaxy.ini
else
    cp galaxy.ini galaxy.ini.orig-$(date "+%y-%m-%d-%H%M") 
fi
# disable debug and use_interactive for production
echo "production?"
echo ${production}
if [ "${production}" == "y" ]; then
        sed_replace '^#debug = False' 'debug =  False/' galaxy.ini
        sed_replace '^use_interactive = True' 'use_interactive = False' galaxy.ini
        echo "replaced debug and use_interactive from galaxy.ini"
fi

echo ${dburl}

if [ ! -z ${dburl} ]; then
    sed_replace '#database_connection.*' "database_connection = ${dburl}" galaxy.ini
    echo "replaced dburl from galaxy.ini"
fi
