#!/bin/bash

## This is the script for the tool setup using conda

read -p "This tool must be run after the initial galaxy installation. Have you already installed Galaxy [yN]" galaxy_installed

if [ ! "${galaxy_installed}" == "y" ]; then
	echo "Exiting. Install Galaxy first!"
	exit 1
fi

MYDIR="$(dirname "$(realpath "$0")")"
echo "MYDIR full procedure " ${MYDIR}

. settings.sh

sudo yum install gcc.x86_64 gcc-c++.x86_64 patch.x86_64 zlib.x86_64 zlib-devel.x86_64 -y

cp -rf ${MYDIR}/data $HOME
cp -rf ${MYDIR}/genomes $HOME
cp -rf ${MYDIR}/mytools $HOME
sudo chmod go+xr $HOME



echo "Start Galaxy tool setup script script ..."

## Start Tool Setup
sudo -u ${GALAXYUSER} -H sh -c "${MYDIR}/configure_galaxy_tool_setup.sh"

