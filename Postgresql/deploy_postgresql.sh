#!/bin/bash

MYDIR="$(dirname "$(realpath "$0")")"

# 1
yum localinstall http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg/centos94-9.4-1.noarch.rpm

# 2
yum install postgresql94*

# 3  edit /etc/yum.repos.d/CentOS-Base.repo
sed -i  "s/\[base\]/&\nexclude=postgresql*/"  /etc/yum.repos.d/CentOS-Base.repo
sed -i  "s/\[updates\]/&\nexclude=postgresql*/"  /etc/yum.repos.d/CentOS-Base.repo

# 4 (equivalent of chkconfig on to start at reboot)
systemctl enable postgresql-9.4

# 5  (initialize the db)
/usr/pgsql-9.4/bin/postgresql94-setup initdb

# 6 (start the service)
systemctl start postgresql-9.4

# 7 copy attached pg_hba.conf
cp /var/lib/pgsql/9.4/data/pg_hba.conf /var/lib/pgsql/9.4/data/pg_hba.conf.orig-$(date "+%y-%m-%d-%H%M") 
cp ${MYDIR}/pg_hba.conf  /var/lib/pgsql/9.4/data/pg_hba.conf

# 8 enable postgresql ssl  
sed -i  "s/^#ssl =.*/ssl = on/" /var/lib/pgsql/9.4/data/postgresq.conf

# 8 generate postgresql certificate

cd /var/lib/pgsql/9.4/data/
openssl genrsa -des3 -out server.key 1024
openssl rsa -in server.key -out server.key
chmod 400 server.key 
chown postgres.postgres server.key 
openssl req -new -key server.key -days 5000 -out server.crt -x509
cp server.crt root.crt

echo " === Postgresql server installed successfully! Please read the last instructions here below :"
cat "LAST_INSTRUCTIONS.md"
