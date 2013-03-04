#!/bin/bash

if [ $# -lt 2 ]; then
    echo "Usage: $0 Info.plist bundleId [environment]"
else
    if [ $# -eq 3 ]; then
        BUNDLE_ID="$2-$3"
    else
        BUNDLE_ID="$2"
    fi
    echo "Setting bundleID ${BUNDLE_ID}"
    /usr/libexec/PlistBuddy -c "Set CFBundleIdentifier $BUNDLE_ID" $1
fi
