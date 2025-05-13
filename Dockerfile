<<<<<<< HEAD
FROM node:18
=======
# STAGE - 1
FROM node:18-slim AS builder
WORKDIR /app 
COPY package*.json ./
RUN npm install 
>>>>>>> origin/uat

WORKDIR /app

# Copy package files first
COPY package*.json ./

# Clean npm cache and install dependencies
RUN npm cache clean --force && npm install --production --verbose

# Copy application code (node_modules will be ignored by .dockerignore)
COPY . .
<<<<<<< HEAD

# Expose the port the app runs on
EXPOSE 5000

# Command to run the application
CMD ["node", "index.js"]
=======
# STAGE - 2

FROM node:18-slim AS production 
WORKDIR /app 
COPY --from=builder /app /app
RUN npm install --only=production --verbose
EXPOSE 5000
ENTRYPOINT ["npm","start"]
>>>>>>> origin/uat
