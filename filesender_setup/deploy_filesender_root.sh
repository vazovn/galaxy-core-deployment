#!/bin/bash

## Script deploying filesender (files reguiring root privileges)

echo "=== Filesender installation start (root privileges) === "

MYDIR="$(dirname "$(realpath "$0")")"

# source settings
. ${MYDIR}/../settings.sh

# Install php55 and fastcgi server
yum install php55.x86_64 php55-php-pgsql.x86_64 php55-php-pdo.x86_64 php55-php-mbstring.x86_64 php55-php-fpm.x86_64

# fast-cgi server config
cp php.conf /etc/httpd/conf.d/

# check if the following is permanent, if not edit /etc/profile.d/bash_login.sh
source /opt/rh/php55/enable

# create bash_login.sh and add php path there; do nothing if already there
if [ ! -f /etc/profile.d/bash_login.sh ] ; then
	touch /etc/profile.d/bash_login.sh
	echo -e "export PATH=/opt/rh/php55/root/usr/bin:/opt/rh/php55/root/usr/sbin${PATH:+:${PATH}}" >> /etc/profile.d/bash_login.sh
else
	PHP_CHECK=$(cat /etc/profile.d/bash_login.sh | grep php ; echo $?)
	if [ $PHP_CHECK == 1 ]; then
		echo -e "export PATH=/opt/rh/php55/root/usr/bin:/opt/rh/php55/root/usr/sbin${PATH:+:${PATH}}" >> /etc/profile.d/bash_login.sh
	fi
fi

# install composer
if [ ! -d /opt/composer ]; then
	mkdir /opt/composer
fi
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php --install-dir=/opt/composer
php -r "unlink('composer-setup.php');"

# start fpm service
systemctl start php55-php-fpm.service

# simplesamlphp
sh -c "${MYDIR}/deploy_filesender_simplesamlphp_code.sh"

# filesender self
sh -c "${MYDIR}/deploy_filesender_code.sh"

# Apache config files for filesender virtual host
sh -c "${MYDIR}/deploy_filesender_apache_config.sh"

# Change Virtual Host in ssl.conf
sed -i  "s/VirtualHost _default_/VirtualHost ${GALAXY_PUBLIC_HOSTNAME}/"  /etc/httpd/conf.d/ssl.conf

echo "=== Filesender installation end (root privileges) === "
