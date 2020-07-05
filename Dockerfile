FROM ruby:2.6.6-alpine

RUN apk update; \
    apk add --no-cache --virtual .build-deps build-base linux-headers \
    git postgresql-dev sqlite-dev mariadb-dev bash

RUN gem update --system
RUN gem install bundler:2.1.4

ENV GEM_HOME=/usr/local/bundle
ENV PATH $GEM_HOME/bin:$GEM_HOME/gems/bin:$PATH

ENV APP_PATH /example-api
WORKDIR $APP_PATH

COPY Gemfile $APP_PATH
COPY Gemfile.lock $APP_PATH

RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

COPY . $APP_PATH

EXPOSE 8080
