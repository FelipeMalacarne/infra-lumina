FROM nginx:stable-alpine

WORKDIR /etc/nginx/conf.d

COPY infra-lumina/nginx/front.conf .

WORKDIR /var/www/html

COPY front-lumina/.next .