#!/bin/bash

## Script installing GOLD components as gold user
## Gold's GUI is _NOT_ installed by this script!!

MYDIR="$(dirname "$(realpath "$0")")"

# source settings
. ${MYDIR}/settings.sh

cd

## clone GOLD
if [ -e "gold-2.2.0.5" ]; then
	echo "GOLD source found ..."
else
	git clone https://${UIOUSER}@bitbucket.usit.uio.no/scm/ft/gold-code.git gold-2.2.0.5
fi

cd gold-2.2.0.5
./configure --prefix=${GOLD_INSTALLATION_DIRECTORY}/gold --with-db=Pg --with-log-dir=${GOLD_INSTALLATION_DIRECTORY}/gold/log --with-perl-libs=local --with-gold-libs=local 
make

echo "GOLD configure and make commands done ... exiting deploy-gold-user.sh"
