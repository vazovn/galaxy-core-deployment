#!/bin/bash 

VER_SLURM="15.08.8-1"

cd /export/rocks/install/contrib/6.2/x86_64/RPMS/

slurm_rpms=$(for i  in $(ls | grep $VER_SLURM | grep "devel\|munge\|plugins\|perlapi\|slurm-$VER_SLURM"); do printf /export/rocks/install/contrib/6.2/x86_64/RPMS/$i ; done;)

echo $slurm_rpms
