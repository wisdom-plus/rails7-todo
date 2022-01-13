FROM ruby:2.7.2-alpine

WORKDIR /todo

ENV PORT 3001

COPY Gemfile Gemfile.lock  ./

RUN apk  --no-cache add gcc \
        g++ \
        libc-dev \
        libxml2-dev \
        linux-headers \
        make \
        nodejs \
        postgresql \
        postgresql-dev \
        tzdata \
        git \
        yarn && \
    apk add --virtual build-dependencies --no-cache build-base curl-dev &&\
    gem install bundler -v 2.2.14 &&\
    bundle install -j4 &&\
    apk del build-dependencies

COPY . .

EXPOSE 3000
