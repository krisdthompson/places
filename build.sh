#!/bin/bash

# Production URL
export HUGO_BASEURL="https://places.kttex.com"

# Clean the public directory
echo "Cleaning public directory..."
rm -rf public

# Build the site in production mode (no drafts)
echo "Building site in production mode (no drafts)..."
hugo \
  --minify \
  --gc \
  --logLevel debug 