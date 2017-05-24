#!/bin/bash

## Script deploying filesender (files reguiring root privileges)

echo "=== Filesender installation start (root privilges) === "

MYDIR="$(dirname "$(realpath "$0")")"

# source settings
. ${MYDIR}/../settings.sh

# Install php55 and fastcgi server
yum install php55.x86_64
yum install php55-php-pgsql.x86_64
yum install yum install php55-php-pdo.x86_64
yum install php55-php-mbstring.x86_64
yum install php55-php-fpm.x86_64

# fast-cgi server config
cp php.conf /etc/httpd/conf.d/

# check if the following is permanent, if not edit /etc/profile.d/bash_login.sh
source /opt/rh/php55/enable

# start fpm service
systemctl start php55-php-fpm.service

# simplesamlphp
sh -c "${MYDIR}/deploy_filesender_simplesamlphp_code.sh"

# filesender self
sh -c "${MYDIR}/deploy_filesender_code.sh"

# Apache config files for filesender virtual host
sh -c "${MYDIR}/deploy_filesender_apache_config.sh"

