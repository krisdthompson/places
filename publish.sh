#!/bin/bash

# Load environment variables from env/hugo.env
if [ ! -f "env/hugo.env" ]; then
    echo "Error: env/hugo.env not found!"
    echo "Please copy env/hugo.env.sample to env/hugo.env and edit it with your production settings."
    exit 1
fi

source env/hugo.env

# Use production settings
export HUGO_ENV="$PROD_HUGO_ENV"
export HUGO_BASEURL="$PROD_HUGO_BASEURL"
echo "Using production environment for publishing to $PROD_HUGO_BASEURL"

# Build the site in production mode
./build.sh production

# Check if build was successful
if [ $? -ne 0 ]; then
    echo "Build failed! Aborting publish."
    exit 1
fi

# Sync to server
echo "Publishing to $HUGO_BASEURL"
echo "Debug: DEPLOY_HOST=${DEPLOY_HOST}"
echo "Debug: DEPLOY_PATH=${DEPLOY_PATH}"
echo "Debug: rsync command: rsync -avz --delete public/ ${DEPLOY_HOST}:${DEPLOY_PATH}/"
rsync -avz --delete public/ "${DEPLOY_HOST}:${DEPLOY_PATH}/"

# Check if rsync was successful
if [ $? -ne 0 ]; then
    echo "Rsync failed! Aborting publish."
    exit 1
fi 