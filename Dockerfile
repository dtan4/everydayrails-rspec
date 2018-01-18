FROM ruby:2.5.0-alpine

ENV TIMEZONE Asia/Tokyo

RUN apk add --no-cache -U tzdata \
    && ln -sf /usr/share/zoneinfo/$TIMEZONE /etc/localtime

RUN bundle config --global build.nokogiri \
      --use-system-libraries \
      --with-xml2-config=/usr/bin/xml2-config \
      --with-xslt-config=/usr/bin/xslt-config

RUN apk add --no-cache -U \
      bash \
      nodejs \
      libxml2-dev \
      libxslt-dev \
      postgresql-dev

WORKDIR /app

COPY Gemfile /app/
COPY Gemfile.lock /app/

RUN apk add --no-cache -U --virtual build-deps \
      g++ \
      make \
    && bundle install -j4 --deployment --without development test \
    && apk del build-deps

COPY . /app

RUN bundle exec rake assets:precompile

EXPOSE 3000

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
