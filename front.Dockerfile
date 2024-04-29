FROM node:v20.10.0-alpine3.13

WORKDIR /app

COPY package*.json ./

RUN ["npm", "install", "--force"]

COPY . .

CMD ["npm", "run", "dev"]

EXPOSE 3000