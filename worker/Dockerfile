FROM node:alpine

WORKDIR /app

COPY ./package.json ./

RUN npm install

COPY . .

# use "start" in production environment

CMD ["npm","run","start"] 