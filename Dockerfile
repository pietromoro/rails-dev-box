FROM ubuntu:focal

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Rome
RUN apt-get update && apt-get -y install tzdata

RUN apt-get update && apt-get -y install sqlite3 libsqlite3-dev mysql-server libmysqlclient-dev postgresql postgresql-client postgresql-contrib libpq-dev redis-server memcached

RUN apt-get update && apt-get -y install gnupg2 curl

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get -y install ruby-full build-essential autoconf libtool

RUN gem update --system -N
RUN gem install bundler -N

RUN apt-get update && apt-get -y install git rabbitmq-server

USER postgres
RUN /etc/init.d/postgresql start && createuser --superuser root
RUN /etc/init.d/postgresql start && createdb -O root -E UTF8 -T template0 activerecord_unittest
RUN /etc/init.d/postgresql start && createdb -O root -E UTF8 -T template0 activerecord_unittest2
USER root

RUN apt-get update && apt-get -y install imagemagick mupdf mupdf-tools ffmpeg poppler-utils
RUN apt-get update && apt-get -y install libxml2 libxml2-dev libxslt1-dev libncurses5-dev nodejs yarn

RUN mkdir -p /bundle
ENV BUNDLE_PATH=/bundle

RUN mkdir -p /rails
WORKDIR /rails
