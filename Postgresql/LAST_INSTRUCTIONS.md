
1.

    su postgres

2.

    createuser -d -s -r -l -P galaxydb1_user


3. Restart postgresql server 

    systemctl restart postgresql-9.4
    

4. Create Galaxy Database (galaxydb1)  owned by galaxy user (galaxydb1_user)

    createdb -p 5432 -h 127.0.0.1 -e galaxydb1 -U galaxydb1_user

    type galaxy1 user password : 12345
