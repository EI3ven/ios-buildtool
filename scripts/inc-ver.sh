#!/bin/bash

if [ $# -lt 1 ]; then
	echo "Usage: $0 Info.plist"
else
	OLD_VERSION=`/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" $1`
	VERSION=`echo $OLD_VERSION | awk -F. '{printf "%d.%d.%d.%d", $1, $2, $3, ($4+1)}'`
	/usr/libexec/PlistBuddy -c "Set CFBundleVersion $VERSION" $1
	echo Current version is `/usr/libexec/PlistBuddy -c "Print :CFBundleVersion" $1`	
fi