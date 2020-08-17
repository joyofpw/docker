FROM php:7.4-apache

RUN apt-get update && apt-get install -y \
        locales locales-all \
        libpq-dev \
        libzip-dev \
        libicu-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libwebp-dev \
        git \
        && docker-php-ext-configure gd --with-jpeg --with-freetype \
        && docker-php-ext-install -j$(nproc) gd \
        && docker-php-ext-install pdo \
        && docker-php-ext-install pdo_mysql \
        && docker-php-ext-install mysqli \
        && docker-php-ext-install intl \
        && docker-php-ext-install zip \
        && rm -rf /var/lib/apt/lists/* 

# Ensure we create the cluster with UTF-8 locale
ENV LANGUAGE=en_US.UTF-8
ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LC_TYPE=en_US.UTF-8

RUN locale-gen
RUN dpkg-reconfigure locales

# apache
RUN a2enmod rewrite

# Clean Up
RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/www/html/.git

# Init
COPY docker/processwire/init.sh /init.sh
RUN chmod +x /init.sh

WORKDIR /var/www/html

CMD ["/init.sh"]
