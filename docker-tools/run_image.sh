#!/bin/bash

# now run the latest docker image
docker run -d --restart=unless-stopped -p 8080:8080 tutoraat_web
