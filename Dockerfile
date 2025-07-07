# Use Node.js 22 as base image
FROM docker.io/lennytaelman/elan-base:latest AS base

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install Node.js dependencies
RUN npm ci --only=production

# Copy source code
COPY . .

# Build stage
FROM base AS builder

# Install dev dependencies for building
RUN npm ci

# Build the client
RUN npm run build:client

# Build the server and Lean projects
RUN npm run build:server

# Production stage
FROM docker.io/lennytaelman/elan-base:latest AS production

# Create app user for security
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Set working directory
WORKDIR /app

# Copy built application from builder stage
COPY --from=builder --chown=appuser:appuser /app/client/dist ./client/dist
COPY --from=builder --chown=appuser:appuser /app/server ./server
COPY --from=builder --chown=appuser:appuser /app/Projects ./Projects
COPY --from=builder --chown=appuser:appuser /app/package*.json ./

# Ensure build scripts are executable
RUN chmod +x Projects/*/build.sh

# Install only production dependencies
RUN npm ci --only=production

# Switch to non-root user
USER appuser

# Expose port
EXPOSE 8080

# Set environment variables
ENV NODE_ENV=production
ENV PORT=8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8080/ || exit 1

# Start the application
CMD ["npm", "run", "production"] 