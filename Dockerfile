# Stage 1: Build dependencies
FROM node:18-alpine as builder

WORKDIR /app
COPY package*.json ./
RUN npm install

# Stage 2: Copy and run
FROM node:18-alpine

WORKDIR /app

COPY --from=builder /app/node_modules ./node_modules
COPY . .

EXPOSE 3000
CMD ["npm", "start"]
