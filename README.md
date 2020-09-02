# Deploy security model for nix system for enterprise data

This package was designed to run on Ubuntu 19.04

## Description

Creates everything required to impliment a security model from start to finsh

## Getting Setup

Follow the manual steps in `setup.sh`  
Then from the `scripts` directory, as user nixadmin, run the following:  

```sh
sudo ./users-groups.sh
```

## Usage

Run order of the scripts there after is following:

```sh
 ## Only run this line if the agency has not already been deployed
 sudo ./dir-agency.sh -p ./param-files/global.json -l a -a nfl
 ## Usually just run this command for a business unit deployment
 sudo ./dirStruct.sh -p ./param-files/global.json -l b -a nfl -b patriots
```

## Success

The directories have been deployed as per the security model:  
![](img/ubuntu-deployed.png)  

The example user MichaelJordan in {agency: nba, businessunit: bulls} can change into directories allowed and write files where allowed.  
![](img/ubuntu-tests.png)
