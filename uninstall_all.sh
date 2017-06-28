#! /bin/bash

read -p "Are you running this script as root (sudo) [yN]" iamsudo
if [ "${iamsudo}" == "y" ]; then
	:
else
	exit 1
fi

## Apache
apachectl stop
yum erase httpd*

## Postgresql
systemctl stop postgresql-9.4.service
yum erase postgresql94*
cd /var/lib
rm -rf pgsq

grep -v "exclude=postgres" /etc/yum.repo.d.CentOS-Base.repo > temp && mv temp /etc/yum.repo.d.CentOS-Base.repo

## Galaxy
cd /home
rm -rf galaxy
grep -v "galaxy"  /etc/passwd > temp && mv temp /etc/passwd
grep -v "galaxy"  /etc/group > temp && mv temp /etc/group

rm /etc/profile.d/z_galaxyprompt.sh
