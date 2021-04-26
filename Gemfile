source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.4', '>= 5.2.4.5'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker'
gem 'react-rails' 

# Open Weather Wrapper 
# gem 'open-weather'
gem 'open-weather-ruby-client'

# Authentication solution
gem 'devise'

# Admin Page Solution
gem 'rails_admin', '~> 2.0'

# Forms are easy !
gem 'simple_form'

# gem 'bootstrap-sass', '~> 3.3.4'
gem 'bootstrap-sass'
#gem 'font-awesome-sass', '~> 4.3.0'
# gem 'jquery-ui-rails'
gem 'jquery-rails'

gem 'bootstrap-social-rails'

gem "font-awesome-rails"

gem 'popper_js', '~> 2.6.0'

# Generate new users
gem 'faker'

# Authorization Library
gem 'cancancan'

# Hirb console
gem 'hirb'

# Address Parser
gem 'jt-rails-address'

# charts
gem 'chartkick'

# blazer for charts
gem 'blazer'

# httparty
gem 'httparty'
gem 'multipart-post'

# Storing Keys
gem 'dotenv-rails', groups: [:development, :test]

# Twilio
gem 'twilio-ruby'

# ZenDesk
gem "zendesk_api"

# Dropbox
gem 'dropbox-sdk-v2', git: 'https://github.com/CoteTommy/dropbox-sdk-ruby'

# IBM Watson
gem 'ibm_watson'

# SendGrid send automatic email WORK IN PROGRESS
gem 'sendgrid-ruby'

# Cloud Vison
gem 'google-cloud-vision', '~> 1.1'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# SimpleCov code coverage analysis tool
gem 'simplecov', require: false, group: :test

# cors 
gem 'rack-cors', :require => 'rack/cors'


group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # gem 'capistrano', '~> 3.10', require: false
  gem 'capistrano', '~> 3.11.0'
  gem 'capistrano-rails', '~> 1.4', require: false
  gem 'capistrano-bundler', '>= 1.1.0'
  gem 'rvm1-capistrano3', require: false
  gem 'capistrano3-puma'
  gem "webmock"
  gem 'rspec-rails', '~> 5.0.0'
  gem 'rails-controller-testing'
  gem 'factory_bot_rails'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'multiverse'
# PostGres
gem 'pg'
gem 'csv'
gem 'rake'
# YAML: Read Write Parse .yml doc
gem 'yaml'
# reCaptcha
gem 'recaptcha', :require => 'recaptcha/rails'