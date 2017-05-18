
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
sed -i  "s/admin.abel.uio.no.*/#&\nadmin.abel.uio.no:\/work    \/work    nfs4    defaults,context=system_u:object_r:httpd_sys_rw_co–ntent_t:s0    0 0/"  /etc/fstab
mount /work
echo "Check context of /work below, must contain context=system_u:object_r:httpd_sys_rw_content_t:s0 :"
echo "====="
echo $(cat echo /etc/fstab | grep httpd)

## filesender tree
cd /opt/filesender
git clone https://github.com/filesender/filesender.git filesender-2.0
ln -s filesender-2.0/ filesender
cd filesender


## For INFO : All filesender configs are located actually in the file 
## ..filesender/includes/ConfigDefaults.php

cp ${MYDIR}/config-filesender.php config/config.php

sed -i  "s/FILESENDER_URL/${FILESENDER_URL}/" config/config.php
sed -i  "s/FILESENDERHOST/${FILESENDERHOST}/" config/config.php
sed -i  "s/FILESENDERDBNAME/${FILESENDERDBNAME}/" config/config.php
sed -i  "s/FILESENDERUSER/${FILESENDERUSER}/" config/config.php
sed -i  "s/FILESENDERPASSWORD/${FILESENDERPASSWORD}/" config/config.php

## File with customized welcome page
cp ${MYDIR}/site_splash.html.php language/en_AU/site_splash.html.php

chgrp apache config/config.php
semanage fcontext -a -t httpd_sys_content_t '/opt/filesender(/.*)?'
restorecon -R /opt/filesender

echo "=== Filesender installed and configured! === "


