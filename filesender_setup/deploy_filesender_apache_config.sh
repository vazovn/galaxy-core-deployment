#!/bin/bash

## Script deploying apache config for the filesender site

MYDIR="$(dirname "$(realpath "$0")")"

# source settings
. ${MYDIR}/../settings.sh

cp ${MYDIR}/filesender.conf /etc/httpd/conf.d/filesender.conf

sed -i  "s/FILESENDER_URL/${FILESENDER_URL}/"  /etc/httpd/conf.d/filesender.conf
sed -i  "s/FILESENDER_LOG_PATH/${FILESENDER_LOG_PATH}/"  /etc/httpd/conf.d/filesender.conf
sed -i  "s/FILESENDER_SSL_CERTIFICATE_PATH/${FILESENDER_SSL_CERTIFICATE_PATH}/"  /etc/httpd/conf.d/filesender.conf
sed -i  "s/FILESENDER_SSL_KEYFILE_PATH/${FILESENDER_SSL_KEYFILE_PATH}/"  /etc/httpd/conf.d/filesender.conf

echo "=== Filesender conf file for Apache ready! === "
