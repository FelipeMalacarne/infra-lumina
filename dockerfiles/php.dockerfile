FROM php:8.3-fpm-alpine

WORKDIR /var/www/html

COPY back-lumina/ .
# Instalando extensões necessárias do PHP
RUN apk update \
    && apk upgrade \
    && apk add --no-cache \
    msmtp \
    perl \
    wget \
    procps \
    shadow \
    libzip-dev \
    libpng-dev \
    libxml2-dev \
    libjpeg-turbo-dev \
    libwebp-dev \
    libmcrypt-dev \
    freetype-dev \
    icu-dev \
    postgresql-client \
    postgresql-dev

# Install development packages
RUN apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    && pecl install redis mongodb \
    && docker-php-ext-enable redis mongodb \
    && docker-php-ext-install pdo_pgsql intl bcmath opcache exif zip gd \
    && docker-php-ext-configure gd --enable-gd --with-freetype --with-jpeg --with-webp \
    && apk del .build-deps

# Cleanup
RUN rm -rf /var/cache/apk/*

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN addgroup -g 1000 laravel && adduser -G laravel -g laravel -s /bin/sh -D laravel

RUN chown -R laravel /var/www/html

USER laravel
