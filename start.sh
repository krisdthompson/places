#!/bin/bash

# Load environment variables from env/hugo.env
if [ -f "env/hugo.env" ]; then
    source env/hugo.env
    echo "Using development environment from env/hugo.env"
    # Use development settings
    export HUGO_ENV="$DEV_HUGO_ENV"
    export HUGO_BASEURL="$DEV_HUGO_BASEURL"
else
    echo "Warning: env/hugo.env not found! Using default settings."
    echo "Consider copying env/hugo.env.sample to env/hugo.env and editing it."
    export HUGO_ENV="development"
    export HUGO_BASEURL="http://localhost:1313"
fi

# Start Hugo server in development mode
echo "Starting Hugo server in $HUGO_ENV mode (HUGO_BASEURL: $HUGO_BASEURL)..."
hugo server \
  --buildDrafts \
  --buildExpired \
  --buildFuture \
  --disableFastRender \
  --navigateToChanged \
  --noHTTPCache \
  --printPathWarnings \
  --printUnusedTemplates \
  --templateMetrics \
  --watch \
  --port 1313 \
  --bind 0.0.0.0 \
  --environment "$HUGO_ENV" \
  --baseURL "$HUGO_BASEURL" \
  --logLevel debug 