FROM php:8.2-cli

RUN apt-get update && \
    apt-get install -y \
    git \
    libzip-dev \
    unzip \
    && docker-php-ext-install zip sockets

# Instalar la extensión de MongoDB
RUN pecl install mongodb && docker-php-ext-enable mongodb

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY . /var/www/html

WORKDIR /var/www/html

ENV COMPOSER_ALLOW_SUPERUSER=1

RUN composer install

EXPOSE 8000