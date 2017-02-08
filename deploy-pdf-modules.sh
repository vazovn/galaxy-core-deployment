#! /bin/bash

source settings.sh
source ${GALAXYTREE}/.venv/bin/activate

## install wkhtmltopdf
cd ${GALAXYTREE}/.venv/bin
wget http://download.gna.org/wkhtmltopdf/0.12/0.12.4/wkhtmltox-0.12.4_linux-generic-amd64.tar.xz
tar xvf wkhtmltox-0.12.4_linux-generic-amd64.tar.xz 
ln -s ${GALAXYTREE}/.venv/bin/wkhtmltox/bin/wkhtmltopdf wkhtmltopdf
rm wkhtmltox-0.12.4_linux-generic-amd64.tar.xz

## install pdfkit
${GALAXYTREE}/.venv/bin/pip install pdfkit
