# Use official Node.js image version 22 (matching package.json requirement)
FROM node:22-slim

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Install elan (Lean version manager)
RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y
ENV PATH="/root/.elan/bin:$PATH"

# add webclient version file to invalidate cache on lean4web client repo changes
ADD client_version.txt /client_version.txt

# Clone the repository
RUN git clone https://github.com/LennyTaelman/lean4web.git .

# Install client dependencies and build client
RUN npm install && npm run build:client

# add project version file to invalidate cache on project repo changes
ADD project_version.txt /project_version.txt

# build the server (i.e. the Lean project)
# WARNING: this creates a large image including mathlib depedencies!
RUN npm run build:server

# Expose port 8080
EXPOSE 8080

# Runtime command: start production server
CMD ["bash", "-c", "PORT=8080 npm run production"]
