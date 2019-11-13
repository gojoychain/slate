FROM ruby:2.5.1

RUN apt-get update && apt-get install -y nodejs \
&& apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./Gemfile /usr/src/app/
COPY ./Gemfile.lock /usr/src/app/
WORKDIR /usr/src/app

RUN gem update --system
RUN gem install bundler -v 2.0.2
RUN bundler -v
RUN bundle install

COPY . /usr/src/app
VOLUME /usr/src/app/source

EXPOSE 4567

CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
