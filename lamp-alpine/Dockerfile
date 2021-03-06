FROM alpine:latest
ENV TIMEZONE Europe/Copenhagen
RUN apk update && apk upgrade
RUN apk add mariadb mariadb-client \
    apache2 \ 
    apache2-utils \
    curl wget \
    tzdata \
    php8-apache2 \
    php8-cli \
    php8-phar \
    php8-zlib \
    php8-zip \
    php8-bz2 \
    php8-ctype \
    php8-curl \
    php8-pdo_mysql \
    php8-mysqli \
    php8-json \
    php8-xml \
    php8-dom \
    php8-iconv \
    php8-xdebug \
    php8-session \
    php8-intl \
    php8-gd \
    php8-mbstring \
    php8-opcache \
    php8-tokenizer \
    php8-simplexml

# configure timezone, mysql, apache
RUN cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime && \
    echo "${TIMEZONE}" > /etc/timezone && \
    mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld /var/lib/mysql && \
    mkdir -p /run/apache2 && chown -R apache:apache /run/apache2 && chown -R apache:apache /var/www/localhost/htdocs/ && \
    sed -i 's#\#LoadModule rewrite_module modules\/mod_rewrite.so#LoadModule rewrite_module modules\/mod_rewrite.so#' /etc/apache2/httpd.conf && \
    sed -i 's#ServerName www.example.com:80#\nServerName localhost:80#' /etc/apache2/httpd.conf && \
    sed -i 's/skip-networking/\#skip-networking/i' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i '/mariadb\]/a log_error = \/var\/lib\/mysql\/error.log' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i -e"s/^bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/" /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i '/mariadb\]/a skip-external-locking' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i '/mariadb\]/a general_log = ON' /etc/my.cnf.d/mariadb-server.cnf && \
    sed -i '/mariadb\]/a general_log_file = \/var\/lib\/mysql\/query.log' /etc/my.cnf.d/mariadb-server.cnf

RUN sed -i 's#display_errors = Off#display_errors = On#' /etc/php8/php.ini && \
    sed -i 's#upload_max_filesize = 2M#upload_max_filesize = 100M#' /etc/php8/php.ini && \
    sed -i 's#post_max_size = 8M#post_max_size = 100M#' /etc/php8/php.ini && \
    sed -i 's#session.cookie_httponly =#session.cookie_httponly = true#' /etc/php8/php.ini && \
    sed -i 's#error_reporting = E_ALL & ~E_DEPRECATED & ~E_STRICT#error_reporting = E_ALL#' /etc/php8/php.ini


# Configure xdebug
RUN echo "zend_extension=xdebug.so" > /etc/php8/conf.d/xdebug.ini && \ 
    echo -e "\n[XDEBUG]"  >> /etc/php8/conf.d/xdebug.ini && \ 
    echo "xdebug.remote_enable=1" >> /etc/php8/conf.d/xdebug.ini && \  
    echo "xdebug.remote_connect_back=1" >> /etc/php8/conf.d/xdebug.ini && \ 
    echo "xdebug.idekey=PHPSTORM" >> /etc/php8/conf.d/xdebug.ini && \ 
    echo "xdebug.remote_log=\"/tmp/xdebug.log\"" >> /etc/php8/conf.d/xdebug.ini

WORKDIR /var/www/localhost/htdocs/

EXPOSE 80
EXPOSE 3306
