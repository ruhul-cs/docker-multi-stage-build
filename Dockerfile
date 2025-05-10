# STAGE - 1
FROM node:18 AS builder
WORKDIR /app 
COPY package*.json ./
RUN npm install 

COPY . .

# STAGE - 2

FROM node:18-slim AS production 
WORKDIR /app 
COPY --from=builder /app /app
# removing the unnecessary or dev dependencies from node_modules , 
#prune will remove all the devDependencies module from node_modules
RUN npm prune --production 
# ENTRYPOINT ["node", "index.js"]
EXPOSE 5000
CMD ["/app/start.sh"]