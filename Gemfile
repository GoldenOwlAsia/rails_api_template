source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.8'
# Use pg as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
  gem 'rubocop'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails', '~> 3.5'
  gem 'bind'
  gem 'faker'
  gem "factory_girl_rails"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'letter_opener'
  gem 'dotenv-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'airborne'
  gem 'fuubar'
  gem 'webmock'
  gem 'timecop'
  gem 'vcr'
end

group :production do
  gem "rails_12factor"
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'active_model_serializers', '~> 0.10.0'
gem 'devise'
gem 'rolify'
gem 'cancancan', '~> 1.10'
gem 'rollbar'
gem 'puma'
gem 'slim-rails'
gem 'sentry-raven'
gem 'newrelic_rpm'
