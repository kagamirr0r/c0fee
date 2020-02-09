FROM ruby:2.6.3

ARG RAILS_ENV
ARG RAILS_MASTER_KEY

RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get update -qq \
	&& apt-get install -y build-essential libpq-dev nodejs postgresql-client

RUN apt-get update && apt-get install -y curl apt-transport-https wget && \
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
	apt-get update && apt-get install -y yarn

ENV RAILS_ENV ${RAILS_ENV}
ENV RAILS_MASTER_KEY ${RAILS_MASTER_KEY}

RUN apt-get install -y vim

ENV APP_ROOT /app
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT/Gemfile
COPY Gemfile.lock $APP_ROOT/Gemfile.lock
RUN bundle install
RUN yarn install
COPY . $APP_ROOT

RUN if ["${RAILS_ENV}" = "production"]; then bundle exec rails assets:precompile; else export RAILS_ENV=development; fi

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
