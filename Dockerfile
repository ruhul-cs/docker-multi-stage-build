# STAGE 1: Build stage
FROM node:18 AS builder

RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .
RUN chmod +x /app/start.sh

# STAGE 2: Production stage
FROM node:18 AS production

WORKDIR /app
COPY --from=builder /app/package*.json ./

RUN npm install --only=production
COPY --from=builder /app .
EXPOSE 5000
CMD ["/app/start.sh"]
