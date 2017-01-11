#!/bin/bash 

VER_MUNGE="0.5.10-1"

cd /export/rocks/install/contrib/6.2/x86_64/RPMS/

munge_rpms=$(for i  in $(ls | grep $VER_MUNGE); do printf /export/rocks/install/contrib/6.2/x86_64/RPMS/$i ; done;)

echo $munge_rpms

