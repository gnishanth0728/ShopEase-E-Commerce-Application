FROM node:20-alpine AS base

WORKDIR /app
COPY package*.json ./
RUN npm ci --omit=dev

COPY server.js ./

FROM node:20-alpine
WORKDIR /app
COPY --from=base /app /app

EXPOSE 8085

CMD ["node", "server.js"]
