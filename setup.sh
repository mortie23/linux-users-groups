#!/bin/bash
## Author:  Christopher Mortimer
## Date:    2020-09-02
## Desc:	  Create the base structures
##          Designed to run on Ubuntu 19.04
## Usage:	  Run commands in the OS terminal as sudo

## Create user for sysadmin
useradd -m nixadmin -p nixadmin
# Create group for admin
groupadd sysadmin
# Add user to group
useradd -m nixadmin -p nixadmin
# Add user to sudo group
usermod -aG sudo nixadmin
# Create data root
mkdir /u01/data
# Create scripts root
mkdir /opt/scripts
# Change owner and group
chgrp sysadmin scripts/
chown nixadmin scripts/

# Login as nixadmin
su nixadmin
# Change shell to bash
chsh -s /bin/bash
# SCP the files to linux machine

setfacl --restore=./acl-files/data.acl
setfacl --restore=./acl-files/scripts.acl
