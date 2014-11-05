FROM ubuntu:14.04

MAINTAINER Quinten Krijger "https://github.com/Krijger"

ENV DEBIAN_FRONTEND noninteractive

# make sure the package repository is up to date and update ubuntu
# supervisor installation && 
# create directory for child images to store configuration in
RUN \
  sed -i 's/# \(.*multiverse$\)/\1/g' /etc/apt/sources.list && \
  apt-get update && \
  locale-gen en_US.UTF-8 &&\
  apt-get -y install supervisor git && \
  mkdir -p /var/log/supervisor && \
  mkdir -p /etc/supervisor/conf.d
  
  # apt-get -y upgrade && \

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV HOME /root

# supervisor base configuration
ADD supervisor.conf /etc/supervisor.conf

# default command
CMD ["supervisord", "-c", "/etc/supervisor.conf"]
