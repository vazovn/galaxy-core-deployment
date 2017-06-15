#!/bin/bash


# 1 
cd /etc/yum.repos.d/


# 2  nano -c /etc/yum.repos.d/CentOS-Base.repo
to
[base] and [updates] sections
add
exclude=postgresql*

# 3
yum localinstall http://yum.postgresql.org/9.4/redhat/rhel-6-x86_64/pgdg/centos94-9.4-1.noarch.rpm
# 4
yum install postgresql94*
# 5  (equivalent of chkconfig on to start at reboot)
systemctl enable postgresql-9.4
# 6  (initialize the db)
/usr/pgsql-9.4/bin/postgresql94-setup initdb
# 7 (start the service)
systemctl start postgresql-9.4

b. set up the client (set by above commands)
c. create the user and the database (live) 

8  su postgres
9  cd /var/lib/pgsql/9.4/data/
10  createuser -d -s -r -l -P galaxy1

d. configure the access to the database (partly live)

edit the postgresql access file (done)

11 nano /var/lib/pgsql/9.4/data/pg_hba.conf
	
enable postgresql ssl (done) 

12 nano /var/lib/pgsql/9.4/data/postgresq.conf
set
ssl=on

generate postgresql certificate  (done)

13  openssl genrsa -des3 -out server.key 1024
14  openssl rsa -in server.key -out server.key
15  chmod 400 server.key 
16  chown postgres.postgres server.key 
17  openssl req -new -key server.key -days 5000 -out server.crt -x509
18  cp server.crt root.crt

restart postgresql server 

19  systemctl restart postgresql-9.4

create Galaxy Database owned by galaxy user (live)

20  createdb -p 5432 -h 127.0.0.1 -e galaxydb1 -U galaxy1

type galaxy1 user password : 12345

Edit galaxy.ini
       postgres://galaxy1:12345@127.0.0.1:5432/galaxydb1?sslmode=require

	
