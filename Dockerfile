# Начинаем с официального образа PHP с Apache
FROM php:apache

# Устанавливаем необходимые пакеты для GD и ZIP
RUN apt-get update && apt-get install -y \
    libzip-dev \
    libgd-dev \
    && docker-php-ext-install gd zip

# Копируем исходный код OpenCart в рабочий каталог Apache
COPY . /var/www/html/

# Устанавливаем права на рабочий каталог
RUN chown -R www-data:www-data /var/www/html

# Экспортируем порт 80 для Apache
EXPOSE 80
