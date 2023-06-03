FROM php:8.1-fpm-alpine

# Uncomment the the below three lines for production
WORKDIR /var/www/src_code
COPY ./../src .
RUN mv .env.example .env


RUN apk add icu-dev 
RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN docker-php-ext-configure intl && docker-php-ext-install intl

# Uncomment the the below line for production
RUN chown -R www-data:www-data /var/www/src_code



