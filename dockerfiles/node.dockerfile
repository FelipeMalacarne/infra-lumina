# i deprecated this
FROM node:20.12.2-alpine

WORKDIR /app

COPY front-lumina/package*.json ./

RUN ["npm", "install"]

COPY front-lumina/ .

CMD ["npm", "run", "dev"]