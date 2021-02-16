FROM php:7.4-apache

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update \
  && apt-get install -y mariadb-server mariadb-client libmariadbclient-dev --no-install-recommends \
  && docker-php-ext-install pdo pdo_mysql mysqli \
  && docker-php-ext-enable pdo_mysql mysqli \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY ./scripts/ /var/www/html/

COPY ./webpage/ /var/www/html/

ENTRYPOINT service apache2 start \ 
&& service mysql start \ 
&& mysql -u root -e "create database Trucorp;" \
&& mysql -u root -p=  Trucorp < trucorp-db.sql \
&& mysql -u root -e "update mysql.user SET Host='%' WHERE Host='localhost' AND user='root';" \ 
&& mysql -u root -e "ALTER USER root@'%' IDENTIFIED BY 'adam';" \
&& mysql -u root -p='adam' -e "FLUSH PRIVILEGES;" && /bin/bash

RUN chown www-data:www-data /var/www

RUN chmod -R 774 /var/www

EXPOSE 80

