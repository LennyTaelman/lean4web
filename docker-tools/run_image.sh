#!/bin/bash

# Stop all running containers
docker stop $(docker ps -q) 2>/dev/null || true

# Remove all stopped containers
docker rm $(docker ps -aq) 2>/dev/null || true

# Now run the latest docker image
docker run -d --name tutoraat_web --restart=unless-stopped -p 8080:8080 tutoraat_web
