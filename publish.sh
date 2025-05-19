#!/bin/bash

# Build the site
./build.sh

# Check if build was successful
if [ $? -ne 0 ]; then
    echo "Build failed! Aborting publish."
    exit 1
fi

# Sync to server
echo "Publishing to $HUGO_BASEURL"
rsync -avz --delete public/ kttex:~/places/ 