#!/bin/bash

## Script installing GOLD components as gold user
## Gold's GUI is _NOT_ installed by this script!!


# source settings
if [ ! -f "settings.sh" ]; then
    echo Please fill in the variables in the file settings.sh
    cp settings-template.sh settings.sh
    exit 1
fi

. settings.sh

if [ -d "$GOLD_SRC_DIRECTORY" ]; then
	cd ${GOLD_SRC_DIRECTORY}
else
	echo "Download gold source code from http://www.adaptivecomputing.com/downloading?file=/gold/gold-2.2.0.5.tar.gz. Login required!"
	exit 1
fi

./configure --prefix=${GOLD_INSTALLATION_DIRECTORY}/gold --with-db=Pg --with-log-dir=${GOLD_INSTALLATION_DIRECTORY}/gold/log --with-perl-libs=local --with-gold-libs=local 
make

echo "GOLD configure and make commands done ... exiting deploy-gold-user.sh"
