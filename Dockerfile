FROM node:14-alpine AS build

WORKDIR /app
COPY . .
RUN npm install && npm run build

FROM wcjiang/docker-static-website:latest
WORKDIR /home/static
COPY --from=build /app/dist/ .
