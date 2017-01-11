#!/bin/bash
echo "Install munge and slurm client!"

### SLURM RPMS

# -T - disable pseudo-tty allocation
slurm_rpms=$(cat get_slurm_rpms_from_nielshenrik.sh | ssh -T ${USER}@nielshenrik.abel.uio.no)
slurm_rpms=${slurm_rpms//rpm/rpm }

if [ -z "$slurm_rpms" ]; then
	echo "SLURM RPMS NOT FOUND "
	exit 1
else
	echo "SLURM RPMS FOUND " $slurm_rpms
fi

scp -p nielshenrik.abel.uio.no:"${slurm_rpms}" .


### MUNGE RPMS

munge_rpms=$(cat get_munge_rpms_from_nielshenrik.sh | ssh -T ${USER}@nielshenrik.abel.uio.no)
munge_rpms=${munge_rpms//rpm/rpm }

if [ -z "$munge_rpms" ]; then
	echo "MUNGE RPMS NOT FOUND "
	exit 1
else
	echo "MUNGE RPMS FOUND " $munge_rpms
fi

scp -p nielshenrik.abel.uio.no:"${munge_rpms}" .


### INSTALL ALL THE RPMs

# 1. disable automatic update of slurm and munge
sudo sed -i '$ a exclude=slurm* munge*' /etc/yum.conf

# 2. install them
# + libraries needed (localinstall did not work)
sudo yum install hwloc-libs libibumad libibmad
sudo rpm -ivh mun*.rpm
sudo rpm -ivh slu*.rpm

### Add slurm user
sudo sed -i '$ a slurm:x:501:501:Slurm:/etc/slurm:/sbin/nologin' /etc/passwd

### Copy slurm.conf setup from nielshenrik
sudo scp -p ${USER}@nielshenrik.abel.uio.no:/etc/slurm/slurm*.conf /etc/slurm


### Copy munge key from nielshenrik

echo "Copying munge key ... "

if [ -f echo_passwd.sh ]; then
	chmod 755 echo_passwd.sh
else
	echo -e "#!/bin/bash\n\necho \"password\"" >> echo_passwd.sh
	chmod 755 echo_passwd.sh
fi

echo "Type your password:"
read -s password

## edit the echo_passwd.sh file to echo your password
sed -i "s/password/${password}/" echo_passwd.sh

scp -p echo_passwd.sh ${USER}@nielshenrik.abel.uio.no:/tmp/

ssh ${USER}@nielshenrik.abel.uio.no "export SUDO_ASKPASS=/tmp/echo_passwd.sh; cd /tmp; sudo -A /bin/cp /etc/munge/munge.key /tmp/newmungekey.key; sudo -A /bin/chown ${USER}:users /tmp/newmungekey.key; rm echo_passwd.sh"

## revert echo_passwd.sh to template mode
sed -i "s/${password}/password/" echo_passwd.sh

if [ -f newmungekey.key ]; then
	rm -f newmungekey.key
fi

scp  -p ${USER}@nielshenrik.abel.uio.no:/tmp/newmungekey.key .

ssh ${USER}@nielshenrik.abel.uio.no "cd /tmp; rm newmungekey.key"

sudo mv newmungekey.key /etc/munge/munge.key
sudo chown daemon:munge /etc/munge/munge.key

echo "Munge key copied successfully!"
