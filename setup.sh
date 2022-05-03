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

# Install dependancy
sudo apt install jq
sudo apt install acl

# Login as nixadmin
su nixadmin

# Set the permissions on the data directory
sudo setfacl --restore=./acl-files/data.acl
