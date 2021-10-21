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

# ENV PORT=8080
EXPOSE 8080

CMD ["npm", "run", "start"]