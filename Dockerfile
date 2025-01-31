FROM php:8.2-cli

ADD https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions /usr/local/bin/

RUN chmod 755 /usr/local/bin/install-php-extensions

RUN install-php-extensions \
	@composer \
	swoole \
	gd \
	zip \
	pdo_sqlsrv \
	pcntl \
	sockets
	
RUN apt-get update \
	&& apt-get install -y \
	nodejs \
	npm \
	ffmpeg \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists

COPY php.ini /usr/local/etc/php/
