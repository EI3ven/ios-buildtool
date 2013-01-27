#!/bin/bash

if [ $# -lt 4 ]; then
	echo "Usage: IPA DIST_LIST API_TOKEN TEAM_TOKEN"
else
	read -p "Build notes: " NOTES
	curl http://testflightapp.com/api/builds.json \
	    -F file=@$1 \
	    -F api_token=$3 \
	    -F team_token=$4 \
	    -F notes="${NOTES}" \
	    -F notify=True \
	    -F distribution_lists="$2"
fi
