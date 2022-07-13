source 'https://rubygems.org'

gem 'rails', '6.1.6.1'

gem 'bcrypt'
gem 'bootsnap'
gem 'jbuilder'
gem 'jquery-rails'
gem 'pg'
gem 'puma'
gem 'sass-rails'
gem 'turbolinks'
gem 'twitter-bootstrap-rails'
gem 'uglifier', '>= 1.3.0'
gem 'zipkin-tracer'

group :doc do
  gem 'sdoc', require: false
end

group :production do
  gem 'rails_serve_static_assets'
end

group :test do
  gem 'capybara'
  gem 'rails-controller-testing'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', require: false
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'simplecov'
  gem 'simplecov-lcov', '~> 0.8.0'
  gem 'webdrivers', require: !ENV['SELENIUM_DRIVER_URL']
end

group :development do
  gem 'faker'
  gem 'launchy'
  gem 'pry-rails'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'solargraph'
  gem 'spring'
  gem 'spring-commands-rspec'
end
