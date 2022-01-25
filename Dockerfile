FROM ruby:3.0.2
RUN apt-get update && apt-get install -y \
        libsodium-dev \
        libopus-dev \
        ffmpeg
RUN gem install bundler
RUN mkdir /app
WORKDIR /app

COPY ./* /app/
RUN bundle install
