#!/bin/bash

## Script deploying apache config for the filesender site

MYDIR="$(dirname "$(realpath "$0")")"

# source settings
. ${MYDIR}/../settings.sh

cp ${MYDIR}/filesender.conf /etc/httpd/conf.d/filesender.conf


FILESENDER_URL=$(echo  ${FILESENDER_URL} | sed 's/\//\\\//g')
FILESENDER_STORAGE=$(echo  ${FILESENDER_STORAGE} | sed 's/\//\\\//g')
FILESENDER_SSL_CERTIFICATE_PATH=$(echo  ${FILESENDER_SSL_CERTIFICATE_PATH} | sed 's/\//\\\//g')
FILESENDER_SSL_KEYFILE_PATH=$(echo  ${FILESENDER_SSL_KEYFILE_PATH} | sed 's/\//\\\//g')


sed -i  "s/FILESENDER_URL/${FILESENDER_URL}/"  /etc/httpd/conf.d/filesender.conf
sed -i  "s/FILESENDER_STORAGE/${FILESENDER_STORAGE}/"  /etc/httpd/conf.d/filesender.conf
sed -i  "s/FILESENDER_SSL_CERTIFICATE_PATH/${FILESENDER_SSL_CERTIFICATE_PATH}/"  /etc/httpd/conf.d/filesender.conf
sed -i  "s/FILESENDER_SSL_KEYFILE_PATH/${FILESENDER_SSL_KEYFILE_PATH}/"  /etc/httpd/conf.d/filesender.conf

echo "=== Filesender conf file for Apache ready! === "
