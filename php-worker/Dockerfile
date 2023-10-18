FROM php:8.1-alpine

RUN apk --update add wget \
  curl \
  git \
  build-base \
  libmcrypt-dev \
  libxml2-dev \
  linux-headers \
  pcre-dev \
  zlib-dev \
  autoconf \
  cyrus-sasl-dev \
  libgsasl-dev \
  oniguruma-dev \
  supervisor; \

RUN docker-php-ext-install mysqli mbstring pdo pdo_mysql xml pcntl; \
    printf "\n" | pecl install -o -f redis; \
    rm -rf /tmp/pear; \
    docker-php-ext-enable redis \

RUN mkdir -p "/etc/supervisor/logs"
RUN mkdir -p "/var/log/worker"

COPY ./supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisor/supervisord.conf"]