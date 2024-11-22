FROM node:21-alpine AS build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM lipanski/docker-static-website:latest AS production
EXPOSE 3000
COPY --from=build /usr/src/app/dist .