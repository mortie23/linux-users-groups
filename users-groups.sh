#!/bin/bash
## Author:	Christopher Mortimer
## Date:	  2020-09-02
## Desc:	  Create a series of OS groups put users in the groups
##			    Designed to run on Ubuntu 19.04
## Dep:		  mkdir /opt/scripts
## Usage:	  sudo ./users-groups.sh

## Include script with common functions
source  ./common.sh

function createUsers() {
	## Create OS users for (in enterprise environment this will exists)
	echoLog "INFO" "adding users in NBA"
	useradd -m MichaelJordan -p MichaelJordan
	useradd -m ScottiePippen -p ScottiePippen
	useradd -m DennisRodman -p DennisRodman
	echoLog "INFO" "adding users in NFL"
	useradd -m TomBrady -p TomBrady
	useradd -m RobGronkowski -p RobGronkowski
	useradd -m RandyMoss -p RandyMoss
}
createUsers

function createGroups() {
	## Create OS groups for agency (in enterprise environment this will exists e.g. AD sync)
	echoLog "INFO" "adding groups for agency"
	groupadd bigdata_nfl
	groupadd bigdata_nba
	## Create OS groups for business units (in environment environment this will exists e.g. AD sync)
	echoLog "INFO" "adding groups for businessUnit"
	groupadd bigdata_nfl_patriots
	groupadd bigdata_nba_bulls
}
createGroups

function modifyUserGroups() {
	## Add the users to the groups
	echoLog "INFO" "add users to their groups"
	usermod -a -G bigdata_nfl,bigdata_nba nixadmin
	usermod -a -G bigdata_nfl,bigdata_nfl_patriots TomBrady
	usermod -a -G bigdata_nfl,bigdata_nfl_patriots RobGronkowski
	usermod -a -G bigdata_nfl,bigdata_nfl_patriots RandyMoss
	usermod -a -G bigdata_nba,bigdata_nba_bulls MichaelJordan
	usermod -a -G bigdata_nba,bigdata_nba_bulls ScottiePippen
	usermod -a -G bigdata_nba,bigdata_nba_bulls DennisRodman
}
modifyUserGroups
