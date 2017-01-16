#!/bin/bash

## Script installing GOLD components as root
## Gold's GUI is _NOT_ installed by this script!!

MYDIR="$(dirname "$(realpath "$0")")"

# source settings
. ${MYDIR}/settings.sh

## Taking up after the script deploy-gold-user.sh

cd ~gold/${GOLD_SRC_DIRECTORY}

make deps
make install

## missing dependency
cpanm Log::Dispatch::FileRotate

## make auth keys and give pass phrase
randomstring=$(python -c 'import random, string; print "".join(random.choice(string.ascii_uppercase + string.digits) for n in range(random.randint(30,50)))')
echo "Paste this key to the next line!" $randomstring
make auth_key

############ start configuration ############ 
cd ${GOLD_INSTALLATION_DIRECTORY}/gold/etc

## server setup : edit etc/goldd.conf
sed -i -E "s/^server.host =.*/server.host = ${hostname}/" goldd.conf
sed -i -E "s/^database.datasource =.*/database.datasource = DBI:Pg:dbname=${GOLDDB};host=${GOLDDBHOST}/" goldd.conf
sed -i -E "s/^# database.user =.*/database.user = ${GOLDDBUSER}/" goldd.conf
sed -i -E "s/^# database.password =.*/database.password = ${GOLDDBPASSWD}/" goldd.conf
sed -i -E "s/^# account.autogen =.*/account.autogen = false/" goldd.conf
sed -i -E "s/^# allocation.autogen =.*/allocation.autogen = false/" goldd.conf

## client setup : edit etc/gold.conf
sed -i -E "s/^# project.show =.*/project.show = Name,Organization,Active,Users,Machines,Description/" gold.conf



## go back to the repo directory (/tmp/..) to execute patch
cd ${MYDIR}

############ patch /opt/gold/lib/perl5/Log/Log4perl/Config.pm (deprecated methods) ############ 
patch ${GOLD_INSTALLATION_DIRECTORY}/gold/lib/perl5/Log/Log4perl/Config.pm < Config.pm.patch

############ start/stop scripts ############ 

## edit and copy start script start.gold.sh
echo  "${GOLD_INSTALLATION_DIRECTORY}/gold/sbin/goldd start" > start-gold.sh
cp start-gold.sh ${GOLD_INSTALLATION_DIRECTORY}/gold/sbin/

## copy stop script
cp stop-gold.sh ${GOLD_INSTALLATION_DIRECTORY}/gold/sbin/

echo "Start GOLD with the script ${GOLD_INSTALLATION_DIRECTORY}/gold/sbin/start-gold.sh!"

