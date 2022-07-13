FROM ruby:3.0.4-alpine

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
      && bundle install --deployment --without development test \
      && apk del build-deps

COPY . /app

RUN bundle exec rake assets:precompile

EXPOSE 9292

CMD ["bundle", "exec", "rackup", "-o", "0.0.0.0", "-p", "9292"]
