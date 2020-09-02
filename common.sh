## Name:	Common Functions
## Author:	Christopher Moirtimer
## Date:	2020-09-02
## Desc:	Standard functions for use across all scripts
## Usage:	source ./common.sh

## Echo a info log level message with the current time
## usage echoLog "<loglevel>" "<message>"
## where log level is [INFO,WARN,ERROR,etc]
logfile=./logs/log-`date +'%Y%m%d_%H%M%S'.log`
function echoLog() {
	logLevel=${1}
	message=${2}
	strdtm=`date +'%Y-%m-%d_%H:%M:%S'`
	echo "${logLevel}, ${strdtm}, func(${FUNCNAME[1]}), ${message}" |& tee -a ${logfile}
}

## Read the global parameter file and parse it for variables
function globalParamVariables() {
	if [[ -s ${paramfile} ]]
	then
		## Path containing the data directories
		dataRoot=`cat ${paramfile} | jq -r .dataRoot`
		echoLog "INFO" "dataRoot: ${dataRoot}"
	else
		error_code=1
		echoLog "ERROR" "${paramfile} is empty or does not exist"
		exit ${error_code}
	fi
}

## to parse arguments
function parseArgs() {
	POSITIONAL=()
	while [[ $# -gt 0 ]]
	do
	key="$1"

	case $key in
		-p|--paramfile)
		paramfile="$2"
		shift # past argument
		shift # past value
		;;
		-l|--level)
		level="$2"
		shift # past argument
		shift # past value
		;;
		-a|--agency)
		agency="$2"
		shift # past argument
		shift # past value
		;;
		-b|--businessunit)
		businessunit="$2"
		shift # past argument
		shift # past value
		;;
		*)    # unknown option
		POSITIONAL+=("$1") # save it in an array for later
		shift # past argument
		;;
	esac
	done
	set -- "${POSITIONAL[@]}" # restore positional parameters

	echo paramfile = "${paramfile}"
	echo level = "${level}"
	echo agency = "${agency}"
	echo businessunit = "${businessunit}"
}