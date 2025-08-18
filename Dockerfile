# Use Ubuntu 22.04 as base image (matching the installation instructions)
FROM ubuntu:22.04

# Set working directory
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    git \
    bash \
    && rm -rf /var/lib/apt/lists/*

# Install NVM and Node.js (following the exact installation instructions)
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash \
    && bash -c "source ~/.bashrc && nvm install node npm"

# Add NVM to PATH for subsequent commands
ENV NVM_DIR="/root/.nvm"
ENV PATH="$NVM_DIR/versions/node/$(ls $NVM_DIR/versions/node | head -1)/bin:$PATH"

# Install elan (Lean version manager)
RUN curl https://raw.githubusercontent.com/leanprover/elan/master/elan-init.sh -sSf | sh -s -- -y
ENV PATH="/root/.elan/bin:$PATH"

# Clone the repository
RUN git clone https://github.com/LennyTaelman/lean4web.git .

# Install client dependencies and build client
RUN npm install && npm run build:client

# Expose port 8080
EXPOSE 8080

# Runtime command: build server (Lean projects) and start production server
CMD ["bash", "-c", "npm run build:server && PORT=8080 npm run production"]
