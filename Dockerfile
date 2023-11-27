FROM php:8.2.12-apache-bookworm

ARG PROJECT

ENV PROJECT=${PROJECT}

EXPOSE 80

WORKDIR /var/www/${PROJECT}

RUN apt-get update &&\
    apt-get install -y git zip unzip zlib1g-dev libpng-dev

RUN docker-php-ext-install gd

RUN a2enmod rewrite

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" &&\
    php -r "if (hash_file('sha384', 'composer-setup.php') === 'e21205b207c3ff031906575712edab6f13eb0b361f2085f1f1237b7126d785e826a450292b6cfd1d64d92e6563bbde02') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" &&\
    php composer-setup.php --version="2.6.5" &&\
    php -r "unlink('composer-setup.php');" &&\
    mv composer.phar /usr/local/bin/composer

