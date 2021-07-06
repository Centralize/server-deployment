FROM ubuntu:21.04
MAINTAINER "Mikkel Kaas <mkaas@openlab.dk>"

RUN apt-get update; apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install python3 python3-django -y
RUN apt-get install python3-pip python3-venv -y

RUN django-admin --version

WORKDIR /data

EXPOSE 80/tcp
