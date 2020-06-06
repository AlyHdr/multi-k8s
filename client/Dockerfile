FROM node:alpine as builder

WORKDIR /app
COPY ./package.json ./
RUN npm install
COPY . .
# output will be a folder called 'build' having all the production files
RUN npm run build

FROM nginx

# the client is listening on port 3000

EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

COPY --from=builder /app/build /usr/share/nginx/html
