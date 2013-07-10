source 'https://rubygems.org'

# SECURITY
gem 'devise'
gem 'devise_invitable'

# ADMIN
gem 'activeadmin'

# UTILITIES
gem "rails_config"
group :development do
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'

  # continuous integration
  gem 'guard-rails'
  gem 'guard-jasmine'
  gem 'guard-rspec'
  gem 'guard-brakeman'
  gem 'guard-bundler'
  gem 'guard-livereload'
end

# QUALITY
# performance
gem 'dimensions-rails'

group :test, :development do
  # metrics
  gem 'simplecov', require: false
  gem 'simplecov-rcov-text', require: false
  gem 'metric_fu', '4.1.0'
  gem 'rubocop', '0.4.6'

  # security
  gem 'brakeman', require: false

  # performance
  gem 'bullet'

  # test
  gem 'rspec-rails'
  gem 'jasminerice'
end

group :test do
  # test
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'capybara'
end

# CORE
gem 'rails', '3.2.13'
gem 'pg'
gem 'therubyracer'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'compass-rails'

  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

gem "jquery-rails", "2.3.0"