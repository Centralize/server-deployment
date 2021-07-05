FROM ubuntu:21.04
MAINTAINER "Mikkel Kaas <mkaas@openlab.dk>"

RUN apt-get update; apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install samba cifs-utils smbclient -y

EXPOSE 135/tcp
EXPOSE 389/tcp
EXPOSE 636/tcp
EXPOSE 3268/tcp
EXPOSE 3269/tcp
EXPOSE 88/tcp
EXPOSE 445/tcp 
