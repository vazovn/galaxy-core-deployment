#!/bin/bash

MYDIR="$(dirname "$(realpath "$0")")"
echo "MYDIR in deploy_apache.sh : " ${MYDIR}

# install Apache
yum install http.x86_64 httpd-devel.x86_64 httpd-tools.x86_64
yum install mod_ssl  mod_proxy_html
	
# Make it start at boot

systemctl enable httpd

# Configure Apache

cp /etc/httpd/conf/httpd.conf /etc/httpd/conf/original-httpd-conf

# Copy the provided httpd.conf file
cp ${MYDIR}/httpd.conf /etc/httpd/conf/httpd.conf

# Configure the SSL
 	
# Generate self-signed server certificate needed for HTTPS connection

mkdir -p /etc/httpd/keys
cd /etc/httpd/keys

openssl genrsa -out localhost.key 1024
openssl req -new -key localhost.key -out localhost.csr

# Fill in the required fields and set Common name : localhost

openssl x509 -req -days 720 -in localhost.csr -signkey localhost.key  -out localhost.crt

# Move it here
cp localhost.key /etc/pki/tls/private/
cp localhost.crt /etc/pki/tls/certs/

#Create / edit ssl.conf

cd ${MYDIR}

cp /etc/httpd/conf.d/ssl.conf /etc/httpd/conf.d/original-ssl-conf

# Copy the provided httpd.conf file
cp ${MYDIR}/ssl.conf /etc/httpd/conf.d/ssl.conf

#Restart Apache
systemctl restart httpd.service

echo "==============================================================================================="
echo "==================    Apache server installed successfully!  =================================="
echo "==============================================================================================="


