FROM ruby:2.5.3

RUN apt-get update

#RUN gem install bundle

COPY . /app

WORKDIR /app

RUN bundle

#ENTRYPOINT ["tail", "-f", "/dev/null"]
ENTRYPOINT ["rails", "s"]