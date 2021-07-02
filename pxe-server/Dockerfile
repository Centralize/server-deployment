FROM ubuntu:21.04
MAINTAINER "Mikkel Kaas <mkaas@openlab.dk>"

RUN apt-get update; apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install systemctl -y
RUN apt-get install tftpd-hpa apache2 -y

RUN echo "<Directory /srv/tftp>\n\
  Options +FollowSymLinks +Indexes\n\
  Require all granted\n\
</Directory>\n\
Alias /tftp /src/tftp\n\
" > /etc/apache2/conf-available/tftp.conf

RUN a2enconf tftp
RUN service apache2 restart

EXPOSE 69/udp
EXPOSE 80/tcp

#ENTRYPOINT ["/bin/bash -c"]
