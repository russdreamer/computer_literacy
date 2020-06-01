#!/bin/bash

if test ! -f repo_url.txt; then
	echo "--------------------------------"
	echo "repo_url.txt file is not found"
	echo "--------------------------------"
	exit 1
fi

REPO_URL=`cat repo_url.txt`
pat=".*github\.com\/([^\/[:space:]]+\/)([^\/\.[:space:]]+)(\.git)?$"

if [[ ! $REPO_URL =~ $pat ]]; then
	echo "--------------------------------"
	echo "repo_url.txt contains invalid format of repository's link"
	echo "--------------------------------"
	exit 1
fi

REPO_USER=${BASH_REMATCH[1]}
REPO_NAME=${BASH_REMATCH[2]}
mkdir test_repo
cd test_repo
git clone https://github.com/$REPO_USER$REPO_NAME
cd $REPO_NAME

if test ! -f weather.info; then
	echo "--------------------------------"
	echo "weather.info file is not found in your repository"
	echo "--------------------------------"
	exit 1
fi

WEATHER=`cat weather.info`
weather_pat="^[[:space:]]*[0-9]{1,2}\.[0-9]{1,2}\.[0-9]{2,4}[[:space:]]*\:[[:space:]]*[+-]?[0-9]+[[:space:]]*.+[[:space:]]*[a-z, A-Z]+[[:space:]]*\,[[:space:]]*[a-z, A-Z]+[[:space:]]*$"
if [[ ! $WEATHER =~ $weather_pat ]]; then
	echo "--------------------------------"
	echo "weather.info contains invalid format of data"
	echo "--------------------------------"
	exit 1
fi
echo "--------------------------------"
echo "Congratulation! Everything went well!"
echo "--------------------------------"
