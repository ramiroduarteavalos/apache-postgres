FROM ubuntu:20.04

RUN apt update

# Install apache, PHP, and supplimentary programs. curl and lynx-cur are for debugging the container.
RUN apt install 

EXPOSE 80

# Copy site into place.
ADD ../html /var/www/html

# Update the default apache site with the config we created.
ADD apache-config.conf /etc/apache2/sites-enabled/000-default.conf

# By default, simply start apache.
CMD /usr/sbin/apache2ctl -D FOREGROUND
