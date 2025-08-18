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

# Clone the repository
RUN git clone https://github.com/LennyTaelman/lean4web.git .

# Install client dependencies and build client
RUN npm install && npm run build:client

# Expose port 8080
EXPOSE 8080

# Runtime command: build server (Lean projects) and start production server
CMD ["bash", "-c", "npm run build:server && PORT=8080 npm run production"]
