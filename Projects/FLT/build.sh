#!/usr/bin/env bash

# this is an attempt at a clone/build script

# Operate in the directory where this file is located
cd $(dirname $0)

git clone https://github.com/ImperialCollegeLondon/FLT .
lake exe cache get
lake build

