#!/usr/bin/env bash

FROM ruby:3.0.2-buster

WORKDIR /app

RUN apt update -q \
    && apt upgrade -y \
    && apt install -y \
    postgresql \
    git \
    libxml2-dev \
    libxslt-dev \
    && gem install bundler

COPY Gemfile Gemfile.lock ./

RUN bundle config build.nokogiri --use-system-libraries \
  && bundle install -j=$(nproc)

ADD . /app
ENV RAILS_LOG_TO_STDOUT true

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]