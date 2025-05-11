# STAGE - 1
FROM node:18-slim AS builder
WORKDIR /app 
COPY package*.json ./
RUN npm install 

COPY . .
# STAGE - 2

FROM node:18-slim AS production 
WORKDIR /app 
COPY --from=builder /app /app
RUN npm install --only=production --verbose
EXPOSE 5000
ENTRYPOINT ["npm","start"]