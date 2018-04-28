FROM php:7.2-fpm

RUN apt-get update && apt-get install -y wget git zlib1g-dev && docker-php-ext-install zip

RUN wget https://raw.githubusercontent.com/composer/getcomposer.org/1b137f8bf6db3e79a38a5bc45324414a6b1f9df2/web/installer -O - -q | php -- --quiet 

RUN mv composer.phar /usr/local/bin/composer

WORKDIR /home

RUN git clone https://gitlab.com/sinsin91/laravel-example.git

RUN chmod 777 -R laravel-example && cd laravel-example && composer install && cp .env.example .env && php artisan key:generate