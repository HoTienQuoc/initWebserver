FROM php:8.4.12-fpm-alpine

RUN mkdir -p /var/w/html

RUN apk --no-cache add shadow && usermod -u 1000 www-data

RUN docker-php-ext-install pdo pdo_mysql
