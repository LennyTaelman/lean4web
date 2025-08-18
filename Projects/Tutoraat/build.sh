#!/usr/bin/env bash

# this is an attempt at a clone/build script

# Operate in the directory where this file is located
cd $(dirname $0)

# If directory has git content, pull; otherwise clone
if [ -d ".git" ]; then
    git pull
else
    # Remove everything except build.sh and clone
    find . -maxdepth 1 -not -name 'build.sh' -not -name '.' -exec rm -rf {} \;
    git clone https://github.com/LennyTaelman/LeanTutoraat .
fi

lake exe cache get
lake build

