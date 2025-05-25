# STAGE 1 - Builder
FROM node:18-slim AS builder
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install ALL dependencies (including devDependencies for build)
RUN npm ci --verbose

# Copy source code
COPY . .

# STAGE 2 - Production
FROM node:18-slim AS production
WORKDIR /app

# Copy package files to production stage
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production --verbose

# Copy built application from builder stage
COPY --from=builder /app .

EXPOSE 5000
CMD ["npm", "start"]

