# STAGE - 1
FROM node:18-slim AS builder
WORKDIR /app 
COPY package*.json ./
RUN npm install 

COPY . .
RUN npm run build || echo "No build step defined" \
    && chmod +x start.sh

# STAGE - 2

FROM node:18-slim AS production 
WORKDIR /app 
#/app/package*.json /app/start.sh /app/src/ these files will be copied from builder stage to current directory /app
# COPY --from=builder /app/package*.json /app/start.sh /app/src/ ./

COPY --from=builder /app .
# removing the unnecessary or dev dependencies from node_modules , 
#prune will remove all the devDependencies module from node_modules
RUN npm prune --production 
# RUN npm install --only=production
# ENTRYPOINT ["node", "index.js"]
EXPOSE 5000
CMD ["npm","start"]