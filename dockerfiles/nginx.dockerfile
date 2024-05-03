FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

COPY infra-lumina/nginx/default.conf .

RUN mv default.conf default.conf

WORKDIR /var/www/html

COPY back-lumina .
