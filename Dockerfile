FROM debian:stable-slim

MAINTAINER "Marc Smith" <marc_smith@gmx.com>

ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root
RUN apt-get update
RUN apt-get install -y wget bzip2
RUN mkdir /opt/fahclient
RUN wget https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.6/latest.tar.bz2 -O /tmp/fahclient.tar.bz2
RUN tar -xf /tmp/fahclient.tar.bz2 -C /opt/fahclient/ --strip=1
ADD config.xml /opt/fahclient/config.xml
RUN echo "" > /etc/motd
CMD /bin/sh -c '/opt/fahclient/FAHClient | tee /tmp/FAHClient.log'

