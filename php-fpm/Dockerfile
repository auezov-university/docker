FROM php:8.1-fpm

COPY ./php.ini /usr/local/etc/php/conf.d
COPY ./www.pool.conf /usr/local/etc/php-fpm.d
COPY ./opcache.ini /usr/local/etc/php/conf.d/opcache.ini

RUN apt-get update && apt-get install -y \
    libfreetype-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    git \
    libzip-dev zip unzip \
    default-libmysqlclient-dev && \
    docker-php-ext-configure zip && \
    docker-php-ext-install zip && \
    php -m | grep -q 'zip'

RUN docker-php-ext-install bcmath

RUN docker-php-ext-install mysqli

RUN docker-php-ext-install pdo pdo_mysql

RUN docker-php-ext-install opcache

RUN apt-get install -yqq zlib1g-dev libicu-dev g++ && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl

RUN apt-get install -yqq libmagickwand-dev imagemagick && \
    cd /tmp && \
    git clone https://github.com/Imagick/imagick && \
    cd imagick && \
    phpize && \
    ./configure && \
    make && \
    make install && \
    rm -r /tmp/imagick && \
    docker-php-ext-enable imagick && \
    php -m | grep -q 'imagick'

RUN apt-get install -yqq jpegoptim optipng pngquant gifsicle && \
    apt-get clean

RUN pecl install -o -f redis \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis

WORKDIR /var/www

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

CMD ["php-fpm"]

EXPOSE 9000
