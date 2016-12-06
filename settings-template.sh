#!/bin/bash

UIOUSER=
GALAXYUSER=galaxy
GALAXYUSERPID=182649
GALAXYUSERGID=70731
GALAXYUSERHOME=/home/galaxy
GALAXYTREE=/home/galaxy/galaxy

# Galaxy version (branch)
GALAXY_BRANCH=release_16.10

# Config file names
GALAXY_TOOL_CONF=config/tool_conf.xml

# Only needed when abel is mounted
GALAXY_ABEL_MOUNT=1
GALAXY_FILEPATH=/work/projects/galaxy/data/database_galaxy_prod01/files
GALAXY_NEW_FILEPATH=/work/projects/galaxy/data/database_galaxy_prod01/tmp
GALAXY_JOB_WORKING_DIRECTORY=/work/projects/galaxy/data/database_galaxy_prod01/job_working_directory
GALAXY_CLUSTER_FILES_DIRECTORY=/work/projects/galaxy/data/database_galaxy_prod01/slurm

#
GALAXY_BRAND=Lifeportal
GALAXY_PUBLIC_HOSTNAME=lifeportal.uio.no
GALAXY_ADMIN_USERS=n.a.vazov@usit.uio.no,sabry.razick@usit.uio.no,trond.thorbjornsen@usit.uio.no
