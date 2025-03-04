FROM ruby:2.6.3
RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
       curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
       echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
       apt-get update && apt-get install -y yarn
RUN mkdir /app
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
