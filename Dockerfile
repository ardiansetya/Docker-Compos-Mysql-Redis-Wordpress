FROM php:8.2-apache

# Set working directory
WORKDIR /var/www/html

# Install dependencies and required PHP extensions
RUN apt-get update && \
    apt-get install -y libpng-dev && \
    docker-php-ext-install pdo pdo_mysql mysqli gd

# Install Redis extension
RUN pecl install redis && \
    docker-php-ext-enable redis

# Expose port 80
EXPOSE 80

# Command to run Apache in foreground
CMD ["apache2-foreground"]
