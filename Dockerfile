# STAGE 1
FROM node:18-slim AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN ls -la /app/node_modules
# STAGE 2
FROM node:18-slim AS production
WORKDIR /app

COPY --from=builder /app /app

RUN chmod +x start.sh
EXPOSE 5000
CMD ["npm","start"]
