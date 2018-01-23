source 'https://rubygems.org'

gem 'bundler'
gem 'rake'
gem 'hanami',       '~> 0.9'
gem 'hanami-model', '~> 0.7'

gem 'pg'

gem 'sass'

gem 'open_uri_redirections', '~> 0.2.1'
gem 'net-ping'
gem 'puma', '3.11.2'

group :development do
  # Code reloading
  # See: http://hanamirb.org/guides/projects/code-reloading
  gem 'shotgun'
  gem 'byebug', '~> 9.0', '>= 9.0.5'
end

group :test, :development do
  gem 'dotenv', '~> 2.0'
  gem 'guard', '~> 2.14'
end

group :test do
  gem 'minitest'
  gem 'minitest-reporters', '~> 1.1', '>= 1.1.13'
  gem 'guard-minitest', '~> 2.4', '>= 2.4.6'
  gem 'capybara'
  gem 'simplecov', require: false
end

ruby '2.3.3'
