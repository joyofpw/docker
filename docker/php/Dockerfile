FROM php:8.4-apache

RUN apt-get update && apt-get install -y --no-install-recommends \
        libfreetype-dev \
        libjpeg-dev \
        libpng-dev \
        libwebp-dev \
        libzip-dev \
        libonig-dev \
        unzip \
    && rm -rf /var/lib/apt/lists/*

RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install \
        gd \
        mysqli \
        pdo_mysql \
        mbstring \
        zip

RUN a2enmod rewrite

EXPOSE 80
