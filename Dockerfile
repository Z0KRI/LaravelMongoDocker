FROM php:8.2-cli

# Instalacion de composer
RUN curl https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer

RUN apt-get update && apt-get install -y libcurl4-openssl-dev pkg-config libssl-dev

# Instalar la extensión de MongoDB
RUN pecl install mongodb && docker-php-ext-enable mongodb

# Install useful tools
RUN apt-get update -y && apt-get install apt-utils nano wget dialog vim -y

RUN apt-get update -y && apt-get -y install --fix-missing \
    apt-utils \
    build-essential \
    git \
    curl \
    libcurl4 \
    libcurl4-openssl-dev \
    zlib1g-dev \
    libzip-dev \
    zip \
    libbz2-dev \
    locales \
    libmcrypt-dev \
    libicu-dev \
    libonig-dev \
    libxml2-dev

EXPOSE 8000