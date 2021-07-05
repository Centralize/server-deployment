FROM ubuntu:21.04
MAINTAINER "Mikkel Kaas <mkaas@openlab.dk>"

RUN apt-get update; apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install systemctl -y
RUN apt-get install apache2 mysql-server -y
RUN apt-get install apt-transport-https lsb-release ca-certificates -y
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:ondrej/php
RUN apt update
RUN apt-get install php8.0 libapache2-mod-php8.0 -y
RUN apt-get install php8.0-fpm libapache2-mod-fcgid -y

RUN a2enmod proxy_fcgi setenvif
RUN a2enconf php8.0-fpm
RUN service apache2 restart

RUN apt-get install php libapache2-mod-php php-mysql -y
RUN service apache2 restart
RUN service mysql restart

RUN echo "<?php phpinfo();" > /var/www/html/info.php

EXPOSE 443/tcp
EXPOSE 3306/tcp
EXPOSE 80/tcp
