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
sed -i -E "s/^server.host =.*/server.host = ${HOSTNAME}/" goldd.conf
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
patch ${GOLD_INSTALLATION_DIRECTORY}/gold/lib/perl5/Log/Log4perl/Config.pm < Config.pm.patch 2>&1 || echo $?

############ start/stop scripts ############ 

## edit and copy start script start.gold.sh
echo  "${GOLD_INSTALLATION_DIRECTORY}/gold/sbin/goldd start" > start-gold.sh
cp start-gold.sh ${GOLD_INSTALLATION_DIRECTORY}/gold/sbin/

## copy stop script
cp stop-gold.sh ${GOLD_INSTALLATION_DIRECTORY}/gold/sbin/

echo "Start GOLD as gold user: sudo -u gold ${GOLD_INSTALLATION_DIRECTORY}/gold/sbin/start-gold.sh!"
sudo -u gold ${GOLD_INSTALLATION_DIRECTORY}/gold/sbin/start-gold.sh

## create gold user in the gold db and add roles to user gold
echo "1. Is gold database imported from an older version? (Please read README.md) "
echo "2. If so, do you want to create a gold user in the gold db and give necessary roles?"
read -p " [yN] " addgolduser


if [ "${addgolduser}" == "y" ]; then
    /opt/gold/bin/gmkuser gold
    /opt/gold/bin/goldsh RoleUser Create Role=SystemAdmin Name=gold
    /opt/gold/bin/goldsh RoleUser Create Role=Scheduler Name=gold
else
    echo "If you are creating db from scratch, this should be bootstrapped. Do you want to run:"
    echo "$ /usr/local/pgsql/bin/psql postgresql://dbuser:dbpass@dbserver/dbname < /home/gold/${GOLD_SRC_DIRECTORY}/bank.sql"
    read -p " [yN] " bootstrapgolddb
    if [ "${bootstrapgolddb}" == "y" ]; then
        if ! rpm -q postgresql; then
            yum -y install postgresql
        fi
        psql postgresql://${GOLDDBUSER}:${GOLDDBPASSWD}@${GOLDDBHOST}/${GOLDDB} < /home/gold/${GOLD_SRC_DIRECTORY}/bank.sql

    fi
fi

