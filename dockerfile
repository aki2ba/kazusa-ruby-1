FROM ruby:3.4-rc-slim-bullseye

WORKDIR /app

COPY . /app/

RUN bundle install

CMD ["ruby", "/app/server.rb"]