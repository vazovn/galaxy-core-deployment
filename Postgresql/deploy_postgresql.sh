#!/bin/bash

MYDIR="$(dirname "$(realpath "$0")")"
echo "MYDIR in deploy_postgresql.sh : " ${MYDIR}

# 2
yum localinstall https://download.postgresql.org/pub/repos/yum/9.6/fedora/fedora-27-x86_64/pgdg-fedora96-9.6-4.noarch.rpm

# 3
yum install postgresql96*

# 4 (equivalent of chkconfig on to start at reboot)
systemctl enable postgresql-9.6

# 5  (initialize the db)
/usr/pgsql-9.6/bin/postgresql96-setup initdb

# 6 (start the service)
systemctl start postgresql-9.6

# 7 copy attached pg_hba.conf
cp /var/lib/pgsql/9.6/data/pg_hba.conf /var/lib/pgsql/9.6/data/pg_hba.conf.orig-$(date "+%y-%m-%d-%H%M") 
cp ${MYDIR}/pg_hba.conf  /var/lib/pgsql/9.6/data/pg_hba.conf

# 8 enable postgresql ssl  
sed -i  "s/^#ssl =.*/ssl = on/" /var/lib/pgsql/9.6/data/postgresql.conf

# 8 generate postgresql certificate

cd /var/lib/pgsql/9.6/data/
openssl genrsa -des3 -out server.key 1024
openssl rsa -in server.key -out server.key
chmod 400 server.key 
chown postgres.postgres server.key 
openssl req -new -key server.key -days 5000 -out server.crt -x509
cp server.crt root.crt


echo "==============================================================================================="
echo "==============    Postgresql server installed successfully!  =================================="
echo "==============================================================================================="

read -p "Do you want to proceed with the rest of the Galaxy installation ? [yN]" proceed_after_postgres
if [ ! "${proceed_after_postgres}" == "y" ]; then
	echo "Galaxy installation will quit now!"	
	exit 1
fi

