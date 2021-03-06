#!/bin/bash

## Script deploying and configuring simplesamlphp

MYDIR="$(dirname "$(realpath "$0")")"

# source settings
. ${MYDIR}/../settings.sh

echo "=== SimpleSamlphp version ${SIMPLESAMLPHP_VERSION} installation start === "

cd /opt
if [ ! -d filesender ]; then
  mkdir filesender
fi

cd filesender

if [ -d simplesamlphp-${SIMPLESAMLPHP_VERSION} ]; then
  rm -rf simplesamlphp-${SIMPLESAMLPHP_VERSION}
fi

if [ -e simplesaml ]; then
	if [ -L simplesaml ]; then 
		echo "simplesaml link exists, deleting ..."
		unlink simplesaml
	fi
fi


wget https://github.com/simplesamlphp/simplesamlphp/releases/download/v${SIMPLESAMLPHP_VERSION}/simplesamlphp-${SIMPLESAMLPHP_VERSION}.tar.gz
tar -zxvf simplesamlphp-${SIMPLESAMLPHP_VERSION}.tar.gz
rm simplesamlphp-${SIMPLESAMLPHP_VERSION}.tar.gz
ln -s simplesamlphp-${SIMPLESAMLPHP_VERSION} simplesaml

cd simplesaml

# create link to log directory
mv log oldlogdir
ln -s ${FILESENDER_SIMPLESAML} log

cp -r config-templates/* config/
cp -r metadata-templates/* metadata/

echo "PHP BINARY " $(which php)
echo "Running composer on simplesamlphp setup"
php /opt/composer/composer.phar install

# 1. edit config/authmemcookie.php
sed -i  "s#'username' => NULL#'username' => 'mail'#" config/authmemcookie.php

# 2. edit config/authsources.php
     
FILESENDER_SSL_CERTIFICATE_PATH=$(echo  ${FILESENDER_SSL_CERTIFICATE_PATH} | sed 's/\//\\\//g')
CERTLINE="\'certificate' => \'${FILESENDER_SSL_CERTIFICATE_PATH}\',"

FILESENDER_SSL_KEYFILE_PATH=$(echo  ${FILESENDER_SSL_KEYFILE_PATH} | sed 's/\//\\\//g')
KEYLINE="\'privatekey\' => \'${FILESENDER_SSL_KEYFILE_PATH}\',"
     
read -p "Paste the IdP url, e.g. https://idp-test.feide.no :" idp
idp=$(echo  ${idp} | sed 's/\//\\\//g')
IDPLINE="\'idp\' => \'${idp}\',"

ATTRIBUTES="\'attributes\' => array(\'mail\' => \'urn:oid:0.9.2342.19200300.100.1.3\',\n\t\t\t\t\'eduPersonPrincipalName\' => \'urn:oid:1.3.6.1.4.1.5923.1.1.1.6\',\n\t\t\t\t\'eduPersonTargetedID\' => \'urn:oid:1.3.6.1.4.1.5923.1.1.1.10\'),\n\t\t\'attributes.required\' => array(\'urn:oid:0.9.2342.19200300.100.1.3\'),\n\t\t\'attributes.NameFormat\' => \'urn:oasis:names:tc:SAML:2.0:attrname-format:uri\',"

sed -i  "s/'saml:SP',/&\n\t\t${ATTRIBUTES}/"  		config/authsources.php        
sed -i  "s/'saml:SP',/&\n\t\t${CERTLINE}/"  		config/authsources.php
sed -i  "s/'saml:SP',/&\n\t\t${KEYLINE}/"  			config/authsources.php
sed -i  "s/'idp' => null,/\/\/&\n\t\t${IDPLINE}/"  	config/authsources.php

# 3. edit config/config.php

sed -i  "s/'loggingdir' => .*/\'loggingdir\' => \'\/opt\/filesender\/simplesaml\/log\',/"  config/config.php
sed -i  "s/'timezone' => .*/\'timezone\' => \'Europe\/Oslo\',/"  config/config.php
sed -i  "s/'secretsalt' => 'defaultsecretsalt',/\'secretsalt\' => \'0xvv95xqmxt340owo0je0fu84uwhnet1\',/"  config/config.php
sed -i  "s/'logging.level' => .*/\'logging.level\' => SimpleSAML_Logger::INFO,/"  config/config.php
sed -i  "s/'logging.handler' => .*/\'logging.handler\' => \'file\',/"  config/config.php
sed -i  "s/\/\/'logging.format'/\'logging.format\'/"  config/config.php

echo "In a separate terminal, run :"
echo "source /opt/rh/php55/enable"
echo "/opt/filesender/simplesaml/bin/pwgen.php"
echo "then set a value to 'Enter password', press enter for [sha256] and type 'yes' for salt"

read -p "Paste the encrypted password here : " password_hash
password_hash=$(echo  ${password_hash} | sed 's/\//\\\//g')
sed -i  "s/'auth.adminpassword' => '123',/\'auth.adminpassword\' => \'${password_hash}\',/"  config/config.php

read -p "Technical contact name : " tech_contact
sed -i  "s/'technicalcontact_name' => .*/\'technicalcontact_name\' => \'${tech_contact}\',/"  config/config.php

read -p "Technical contact email : " tech_contact_email
sed -i  "s/'technicalcontact_email' => .*/\'technicalcontact_email\' => \'${tech_contact_email}\',/"  config/config.php

# 4. copy feide-idp file to metadata

cp ${MYDIR}/saml20-idp-remote.php metadata/saml20-idp-remote.php

echo "=== SimpleSamlphp installed and configured! === "
