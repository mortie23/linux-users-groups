#!/bin/bash
## Name:	Directory structure business unit
## Author:	Christopher Mortimer
## Date:	2020-09-02
## Desc:	Create the direcotry structure for the shared volume for a business unit
## Dep:		The agency directory has already been created for the business unit
## Usage:	sudo ./dirStruct.sh -p [paramfile] -l b -a [agency] -b [business-unit]
## Eg:		sudo ./dirStruct.sh -p ./param-files/global.json -l b -a nfl -b patriots

## Include script with common functions
source ./common.sh
## Parse arguments
parseArgs "$@"

## Ensure the argument existed when the script was called
if [[ -z ${paramfile} ]]
then
	error_code=1
	echoLog "ERROR" "parameter file was not provided"
	exit ${error_code}
fi
## If the param exists continue
globalParamVariables

## Ensure the agencyName exists
if [ -z ${agency} ] || [ -z ${businessunit} ] || [ -z ${dataRoot} ]; then
	error_code=1
	echoLog "ERROR" "agency or dataRoot has not resolved"
	exit ${error_code}
fi

function dirStructure() {
	## Create whatever heirachy you have defined in your security model
	echoLog "INFO" "build of directory structure"
	mkdir -p ${dataRoot}/${agency}/${businessunit}
}
dirStructure

function applyACL() {
	## Replace the <rootdir> in the ACL file
	echoLog "INFO" "Setting the ACLs"
	sed "s|<rootdir>|${dataRoot}|g" ./acl-files/${agency}-${businessunit}.acl > ./acl-files/tmp.acl
	setfacl --restore=./acl-files/tmp.acl
	## Remove the tmp file. Commented out while in dev to see result
	rm ./acl-files/tmp.acl
}
applyACL
