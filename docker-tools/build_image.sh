#!/bin/bash

# exit on error
set -e

# set tmp dir to /var/home/tmp
export TMPDIR=~/tmp

# create tmpdir
mkdir -p $TMPDIR

# repositories for web client and tutoraat project
CLIENT_REPO=https://github.com/LennyTaelman/lean4web.git
PROJECT_REPO=https://github.com/LennyTaelman/LeanTutoraat.git

# get web client version
git ls-remote $CLIENT_REPO HEAD | awk '{print $1}' > client_version.txt

# get project repo version
git ls-remote $PROJECT_REPO HEAD | awk '{print $1}' > project_version.txt

# Build the Docker image using the correct temporary dir
docker build -t tutoraat_web .

