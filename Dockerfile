FROM ruby:2.5.3

RUN apt-get update

#RUN gem install bundle

COPY . /app

WORKDIR /app

RUN bundle

#ENTRYPOINT ["tail", "-f", "/dev/null"]
#ENTRYPOINT ["bundle", "exec", "rails", "s", "-p", "3001"]

EXPOSE 3000

# Configure the main process to run when running the image
CMD ["./docker/start.sh"]