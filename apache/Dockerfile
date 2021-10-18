FROM ubuntu:20.04

RUN apt update

RUN apt upgrade

# Install apache.
RUN apt install apache2 

# Install php + other
RUN apt install php7.4 \
    libapache2-mod-php7.4 \
    openssl \
    php-imagick \
    php7.4-common \
    php7.4-curl \
    php7.4-gd \
    php7.4-imap \
    php7.4-intl \
    php7.4-json \
    php7.4-ldap \
    php7.4-mbstring \
    php7.4-pgsql \
    php-ssh2 \
    php7.4-xml \
    php7.4-zip 
    unzip
    curl

EXPOSE 80

# By default, simply start apache.
CMD ["apachectl", "-D",  "FOREGROUND"]
