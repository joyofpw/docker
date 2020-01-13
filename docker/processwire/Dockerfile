FROM php:7.3-apache

# Ensure we create the cluster with UTF-8 locale
ENV LANG en_US.utf8

RUN apt-get update && apt-get install -y \
        libpq-dev \
        libzip-dev \
        libicu-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libwebp-dev \
        git \
        && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        && docker-php-ext-install -j$(nproc) gd \
        && docker-php-ext-install pdo \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-install pdo_pgsql \
        && docker-php-ext-install mysqli \
        && docker-php-ext-install intl \
        && docker-php-ext-install zip \
        && rm -rf /var/lib/apt/lists/*

# apache
RUN a2enmod rewrite

# Volume
VOLUME ["/var/www/html"]

# Clean Up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/www/html/.git

# Init
COPY /init.sh /init.sh
RUN chmod +x /init.sh
CMD ["/init.sh"]
