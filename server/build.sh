#!/usr/bin/env bash

# Navigate to Projects/Tutoraat directory
cd "$(dirname $0)/../Projects/Tutoraat"

echo "Building Tutoraat project"

# Clone or update the LeanTutoraat repository
if [ -d ".git" ]; then
    echo "Updating existing repository..."
    git pull
else
    echo "Cloning LeanTutoraat repository..."
    # Remove everything except build.sh and clone
    find . -maxdepth 1 -not -name 'build.sh' -not -name '.' -exec rm -rf {} \;
    git clone https://github.com/LennyTaelman/LeanTutoraat .
fi

# Build the project
echo "Getting cache and building..."
lake exe cache get
lake build

echo "Tutoraat build completed"
