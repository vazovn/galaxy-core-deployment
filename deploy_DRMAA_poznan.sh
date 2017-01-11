#!/bin/bash
echo "Install Polish DRMAA!"

## create dir for the sources
if [ ! -d DRMAA_src ]; then
	mkdir DRMAA_src
else
	rm -rf DRMAA_src
	mkdir DRMAA_src
fi

## create dir for the binaries
if [ ! -d /site/drmaa ]; then
  echo "Creating directory /site/drmaa for the binaries"
  sudo mkdir -p /site/drmaa
fi

## Remove munge pid and socket if previous munge installation was in place
if  [ -f /var/run/munge/munged.pid ]; then
	sudo rm /var/run/munge/*
fi

## Clone the DRMAA code
cd DRMAA_src
git clone https://${USER}@bitbucket.usit.uio.no/scm/ft/galaxy-poznan-drmaa.git .

## Install missing dependencies
sudo yum install bison
if  [ -f ragel-6.6-2.3.x86_64.rpm ]; then
	sudo yum install ragel-6.6-2.3.x86_64.rpm
else
	echo "ragel package missing, trying to install without it!"
fi

## Install DRMAA
cd slurm-drmaa-1.0.6
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/slurm/lib64
pwd
sudo ./configure --with-slurm-inc=/opt/slurm/include/  --with-slurm-lib=/opt/slurm/lib64/ --prefix=/site/drmaa/ --enable-debug
sudo make
sudo make install

## Configure DRMAA conf
if [ -f /etc/slurm_drmaa.conf ]; then
	sudo rm /etc/slurm_drmaa.conf
fi

echo -e "job_categories: {\n\t\tdefault: \"--comment=hello\",\n\t}," >> slurm_drmaa.conf
sudo mv slurm_drmaa.conf /etc/slurm_drmaa.conf
sudo chown root:root /etc/slurm_drmaa.conf
sudo chmod 644 /etc/slurm_drmaa.conf

echo "Polish DRMAA installed!"

## Configure the resolve files
sudo /bin/su -c "echo 'nameserver 129.240.189.192' >>  /etc/resolv.conf"
sudo /bin/su -c "echo '129.240.189.192 nielshenrik.abel nielshenrik' >>  /etc/hosts"
echo "/etc/hosts and /etc/resolv.conf modified!"


