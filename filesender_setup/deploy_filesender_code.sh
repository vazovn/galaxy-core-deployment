
# The default configs for filesender-2.0 are located in
# ./includes/ConfigDefaults.php - for transfer size, etc
# ./language/en_AU/site_splash.html.php

MYDIR="$(dirname "$(realpath "$0")")"
# source settings
. ${MYDIR}/../settings.sh

## filesender php specs
cp ${MYDIR}/filesender-php.ini /opt/rh/php55/root/etc/php.d/

## edit nfs mount context
umount /work
sed -i  "s/admin.abel.uio.no.*/#&\nadmin.abel.uio.no:\/work    \/work    nfs4    defaults,context=system_u:object_r:httpd_sys_rw_content_t:s0    0 0/"  /etc/fstab
mount /work
echo "Check context of /work below, must contain context=system_u:object_r:httpd_sys_rw_content_t:s0 :"
echo "====="
echo "New /etc/fstab file : " $(grep httpd /etc/fstab)

## filesender tree
cd /opt/filesender

if [ -d filesender-2.0 ]; then
	rm -rf filesender-2.0
fi
git clone https://github.com/filesender/filesender.git filesender-2.0


if [ ! -L filesender ]; then
	ln -s filesender-2.0/ filesender
fi

cd filesender

## Create links to the storage directories on nielshenrik
ln -s ${FILESENDER_STORAGE}/log log
ln -s ${FILESENDER_STORAGE}/tmp tmp
ln -s ${FILESENDER_STORAGE}/files files

## For INFO : All filesender configs are located actually in the file 
## ..filesender/includes/ConfigDefaults.php

cp ${MYDIR}/filesender-config.php config/config.php

sed -i  "s/FILESENDERHOST/${FILESENDERHOST}/"  config/config.php
sed -i  "s/FILESENDERDBNAME/${FILESENDERDBNAME}/"  config/config.php
sed -i  "s/FILESENDERUSER/${FILESENDERUSER}/"  config/config.php
sed -i  "s/FILESENDERPASSWORD/${FILESENDERPASSWORD}/"  config/config.php

sed -i  "s/FILESENDER_URL/${FILESENDER_URL}/"  config/config.php
sed -i  "s/FILESENDER_ADMINISTRATOR/${FILESENDER_ADMINISTRATOR}/"  config/config.php
sed -i  "s/FILESENDER_ADMIN_EMAIL/${FILESENDER_ADMIN_EMAIL}/"  config/config.php


## Create filesender logs and fix the selinux context for them 
if [ ! -d /var/log/filesender ]; then
        mkdir -p /var/log/filesender
	touch /var/log/filesender/ssl_error_log
	touch /var/log/filesender/ssl_access_log
fi

# flush selinux context
semanage fcontext -d "/var/log/filesender(/.*)?"
restorecon -vFR /var/log/filesender/

# set the selinux context again
semanage fcontext -a -t httpd_sys_rw_content_t -s system_u '/var/log/filesender(/.*)?'
restorecon -vFR /var/log/filesender/


## File with customized welcome page
cp ${MYDIR}/site_splash.html.php language/en_AU/site_splash.html.php

chgrp apache config/config.php

echo "=== Filesender installed and configured! === "


