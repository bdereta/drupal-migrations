FROM php:8.2.3-apache-buster

# Set PHP extension versions
ARG EXT_IGBINARY=3.2.1
ARG EXT_MCRYPT=1.0.4
ARG EXT_MSGPACK=2.1.2
ARG EXT_REDIS=5.3.4

# Set Node version
ARG NODE_VERSION=12.18.3

# Set node-sass version
ARG NODE_SASS_VERSION=4.14.1
ARG NODE_MODULE=72

# Disable interaction
ARG DEBIAN_FRONTEND=noninteractive

# Set terminal
ENV TERM=xterm-256color

# Set timezone
ENV TZ=UTC

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Update
RUN apt-get update && apt-get -y upgrade

# Install tools and essential libraries
RUN apt-get -mqy install \
    apt-utils \
    aspell-en \
    build-essential \
    curl \
    default-mysql-client \
    dialog \
    git \
    less \
    libbz2-dev \
    libfreetype6-dev \
    libicu-dev \
    libjpeg62-turbo-dev \
    libldap2-dev \
    liblzma-dev \
    libmcrypt-dev \
    libpng-dev \
    libpspell-dev \
    libssl-dev \
    libxml2-dev \
    libzip-dev \
    openssl \
    unzip \
    vim \
    wget \
    zip \
    zsh

# Add PHP extension builder
COPY scripts/docker-php-ext-get /usr/local/bin/

# Extract PHP source tarball
RUN docker-php-source extract

# Install GD Graphics Library extension
RUN docker-php-ext-configure gd --with-freetype --with-jpeg && \
    docker-php-ext-install gd

# Install Igbinary extension
RUN docker-php-ext-get igbinary/igbinary $EXT_IGBINARY && \
    docker-php-ext-install igbinary

# Install Mcrypt extension
RUN docker-php-ext-get mcrypt $EXT_MCRYPT && \
    docker-php-ext-install mcrypt

# Install MessagePack extension
RUN docker-php-ext-get msgpack $EXT_MSGPACK && \
    docker-php-ext-install msgpack

# Install Redis extension
RUN docker-php-ext-get phpredis/phpredis $EXT_REDIS && \
    docker-php-ext-configure phpredis --enable-redis-igbinary && \
    docker-php-ext-install phpredis

# Install additional PHP extensions
RUN docker-php-ext-install \
    bcmath \
    exif \
    gettext \
    intl \
    ldap \
    mysqli \
    opcache \
    pcntl \
    pdo_mysql \
    pspell \
    soap \
    sockets \
    zip

# Add PHP configurations
COPY conf/* /usr/local/etc/php/conf.d/

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Node
RUN curl -fsSLO --compressed "https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz" && \
    tar -xJf "node-v$NODE_VERSION-linux-x64.tar.xz" -C /usr/local/ --strip 1 && \
    ln -s /usr/local/bin/node /usr/local/bin/nodejs

# Install node-sass
ADD https://github.com/sass/node-sass/releases/download/v$NODE_SASS_VERSION/linux-x64-${NODE_MODULE}_binding.node \
    /usr/local/bin/node-sass/linux-x64-${NODE_MODULE}/binding.node

# Add aliases and functions
COPY shell/* /root/

# Enable Apache modules
RUN a2enmod expires headers rewrite

# Cleanup
RUN apt-get clean && \
    apt-get -y autoremove && \
    rm -rf /tmp/* /usr/src/* /var/lib/apt/lists/* /var/tmp/*
