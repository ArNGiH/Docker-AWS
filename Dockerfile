FROM node:18-alpine as builder

WORKDIR /app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

# /app/build is the production build
EXPOSE 8080
FROM nginx  


COPY --from=builder /app/build /usr/share/nginx/html
