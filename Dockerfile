FROM ruby:2.6.3

ENV LANG C.UTF-8

ENV APP_ROOT /app
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

RUN echo "deb http://security.debian.org jessie/updates main" >> /etc/apt/sources.list &&\
	curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update -qq \
	&& apt-get install -y build-essential libpq-dev nodejs postgresql-client

RUN apt-get install -y vim

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install

COPY . $APP_ROOT

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
