FROM node:14.17.3-alpine AS base
WORKDIR /app

FROM base AS dependencies
COPY package*.json ./
RUN npm install && npm cache clean --force

FROM dependencies AS build
WORKDIR /app
COPY . .
RUN npm run build

WORKDIR /app

EXPOSE 4000

CMD ["npm", "run", "start"]