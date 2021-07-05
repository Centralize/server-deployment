FROM ubuntu:21.04
MAINTAINER "Mikkel Kaas <mkaas@openlab.dk>"

#Initial Install and Upgrades
RUN apt-get update; apt-get upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt-get install sudo -y

# Install PostgreSQL
RUN apt-get install postgresql -y
RUN service postgresql start



