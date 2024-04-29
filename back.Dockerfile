FROM php:8.3.0-fpm

WORKDIR /var/www

RUN apt-get update && apt-get install -y