#!/bin/bash

# Load environment variables from env/hugo.env
if [ ! -f "env/hugo.env" ]; then
    echo "Error: env/hugo.env not found!"
    echo "Please copy env/hugo.env.sample to env/hugo.env and edit it with your settings."
    exit 1
fi

source env/hugo.env

# Determine which environment to use (development or production)
if [ "$1" == "production" ]; then
    # Use production settings
    export HUGO_ENV="$PROD_HUGO_ENV"
    export HUGO_BASEURL="$PROD_HUGO_BASEURL"
    echo "Using production environment settings"
else
    # Use development settings
    export HUGO_ENV="$DEV_HUGO_ENV"
    export HUGO_BASEURL="$DEV_HUGO_BASEURL"
    echo "Using development environment settings"
fi

# Clean the public directory
echo "Cleaning public directory..."
rm -rf public

# Build the site
echo "Building site in $HUGO_ENV mode (HUGO_BASEURL: $HUGO_BASEURL)..."
hugo \
  --minify \
  --gc \
  --environment "$HUGO_ENV" \
  --baseURL "$HUGO_BASEURL" \
  --logLevel debug 