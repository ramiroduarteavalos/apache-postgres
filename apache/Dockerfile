FROM ubuntu:20.04

RUN apt update

RUN apt upgrade

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Madrid
RUN apt-get install -y tzdata

# Install apache.
RUN apt install -y apache2 apache2-utils

# Install php + other
RUN apt install -y php \
    libapache2-mod-php \
    php7.4-cli \
    openssl

COPY src/000-default.conf /etc/apache2/sites-available

COPY htaccess.conf /etc/apache2/conf-enabled/

RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
EXPOSE 80

# By default, simply start apache.
CMD ["apachectl", "-D",  "FOREGROUND"]
