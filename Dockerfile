FROM ruby:2.5-alpine

# set some rails env vars
ENV RAILS_ENV production
ENV BUNDLE_PATH /bundle
ENV APP_HOME /home/solidus

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apk add --update --no-cache \
  tini \
  build-base \
  imagemagick \
  file \
  libxml2-dev \
  libxslt-dev \
  postgresql-dev \
  nodejs

COPY Gemfile* ./
RUN bundle install

ADD . .

EXPOSE 3000
ENTRYPOINT ["/sbin/tini", "--"]
CMD ["bundle", "exec", "rails", "s", "-b 0.0.0.0"]