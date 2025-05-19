#!/bin/bash

# Local development URL
export HUGO_BASEURL="http://localhost:1313"

# Start Hugo server in development mode (with drafts enabled)
echo "Starting Hugo server in development mode (drafts enabled)..."
hugo server \
  --buildDrafts \
  --buildExpired \
  --buildFuture \
  --disableFastRender \
  --navigateToChanged \
  --port 1313 \
  --bind 0.0.0.0 \
  --logLevel debug 