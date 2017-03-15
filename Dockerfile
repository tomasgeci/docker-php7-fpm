FROM php:7.1.2-fpm

MAINTAINER Tomas Geci <tomas.geci@gmail.com>

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
	curl \
	libcurl4-openssl-dev \
	libicu-dev \
    	&& docker-php-ext-configure gd --with-png-dir=/usr/include --with-jpeg-dir=/usr/include \
    	&& docker-php-ext-install gd \
        && docker-php-ext-install pdo_mysql \
	&& docker-php-ext-install curl \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install zip \
	&& docker-php-ext-install intl \
	&& docker-php-ext-install mcrypt \
	#&& docker-php-ext-install imagick \
	#&& docker-php-ext-install xml \
	&& docker-php-ext-install mbstring

RUN usermod -u 1000 www-data

EXPOSE 9000
CMD ["php-fpm", "-F"]
