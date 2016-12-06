#!/bin/bash
echo "under construction!"
echo "1.Install additional packges required listed below.  2.To download the RPMs from nielshenrik.abel.uio.no to current folder 3. install rpms"

echo "sudo yum install rpm-build install bzip2 readline-devel munge-devel lua-devel pam-devel libibmad install hwloc gperf"

echo "Loops to collect files to copy from nielshenrik"
echo "cd  /export/rocks/install/contrib/6.2/x86_64/RPMS"
echo "for i  in $(VER=15.08.8-1;ls | grep $VER | grep "devel\|munge\|plugins\|perlapi\|slurm-$VER"); do echo "scp -p nielshenrik.abel.uio.no:/export/rocks/install/contrib/6.2/x86_64/RPMS/"$i" ."; done;"
echo "for i  in $(VER=0.5.10-1;ls | grep $VER ); do echo "scp -p nielshenrik.abel.uio.no:/export/rocks/install/contrib/6.2/x86_64/RPMS/"$i" ."; done;"

echo "Starting copying RPMS from nielshenrik.abel.uio.no, TIP: it is conveient to login to nielshenrik.abel.uio.no and copy the files from there, other wise typing passwords multiple times needed"
scp -p nielshenrik.abel.uio.no:/export/rocks/install/contrib/6.2/x86_64/RPMS/munge-0.5.10-1.el6.x86_64.rpm .
scp -p nielshenrik.abel.uio.no:/export/rocks/install/contrib/6.2/x86_64/RPMS/munge-devel-0.5.10-1.el6.x86_64.rpm .
scp -p nielshenrik.abel.uio.no:/export/rocks/install/contrib/6.2/x86_64/RPMS/munge-libs-0.5.10-1.el6.x86_64.rpm .
scp -p nielshenrik.abel.uio.no:/export/rocks/install/contrib/6.2/x86_64/RPMS/slurm-15.08.8-1.el6.x86_64.rpm .
scp -p nielshenrik.abel.uio.no:/export/rocks/install/contrib/6.2/x86_64/RPMS/slurm-devel-15.08.8-1.el6.x86_64.rpm .
scp -p nielshenrik.abel.uio.no:/export/rocks/install/contrib/6.2/x86_64/RPMS/slurm-munge-15.08.8-1.el6.x86_64.rpm .
scp -p nielshenrik.abel.uio.no:/export/rocks/install/contrib/6.2/x86_64/RPMS/slurm-pam_slurm-15.08.8-1.el6.x86_64.rpm .
scp -p nielshenrik.abel.uio.no:/export/rocks/install/contrib/6.2/x86_64/RPMS/slurm-perlapi-15.08.8-1.el6.x86_64.rpm .
scp -p nielshenrik.abel.uio.no:/export/rocks/install/contrib/6.2/x86_64/RPMS/slurm-plugins-15.08.8-1.el6.x86_64.rpm .


echo "Install the rpms using sudo rpm -iav *rpm"

echo "test munge with - service munge start"
