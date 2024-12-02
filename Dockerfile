# Use uma imagem base do PHP com Apache
FROM php:8.2-apache

# Instala extensões necessárias para o CakePHP
RUN apt-get update && apt-get install -y \
    libpq-dev \
    libicu-dev \
    && docker-php-ext-install pdo pdo_pgsql pgsql intl

# Configura o diretório de trabalho
WORKDIR /var/www/html

# Copia os arquivos da aplicação para o diretório de trabalho
COPY . /var/www/html

# Define as permissões corretas
RUN chown -R www-data:www-data /var/www/html
