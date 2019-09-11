# STAGE A
# Use an existing docker image as a base
FROM node:alpine as builder

WORKDIR /app

# Download and install a dependency
COPY ./package.json ./
RUN npm install
COPY ./ ./
RUN npm run build

# STAGE B
# Use an existing docker image as a base
FROM nginx as run

# Documentação on dockerhub
COPY --from=builder /app/build /usr/share/nginx/html 
