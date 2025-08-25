#!/usr/bin/env bash

# Navigate to Projects directory
cd "$(dirname $0)/../Projects"

echo "Building LeanTutoraat project"

# Clone the LeanTutoraat repository
git clone https://github.com/LennyTaelman/LeanTutoraat LeanTutoraat
cd LeanTutoraat

# Build the project
echo "Getting cache and building..."
lake exe cache get
lake build

echo "LeanTutoraat build completed"
