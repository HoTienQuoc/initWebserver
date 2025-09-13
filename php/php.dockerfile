FROM php:8.4.12-fpm-alpine

# Create the working directory
RUN mkdir -p /var/www/html

# Install shadow to allow usermod, then change UID of www-data to match host
RUN apk --no-cache add shadow \
    && usermod -u 1000 www-data \
    && chown -R www-data:www-data /var/www/html

# Set working directory
WORKDIR /var/www/html

# Copy source code and set correct ownership
COPY --chown=www-data:www-data . /var/www/html

# Install PHP extensions
RUN docker-php-ext-install pdo pdo_mysql

# Use the www-data user by default
USER www-data
