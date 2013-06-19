source 'https://rubygems.org'

gem 'rails', '3.2.13'

gem 'haml-rails'
gem 'jquery-rails'
gem 'sqlite3'
gem 'bcrypt-ruby', '~> 3.0.0'
gem 'strong_parameters', :github => "rails/strong_parameters", :branch => "master"


group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

group :development do
  gem 'wirble'
  gem 'hirb'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem "letter_opener"
end

group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'spork'
  gem 'capybara'
  gem 'launchy'
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'shoulda-matchers'
  gem 'validates_existence', '>= 0.4'
  gem 'database_cleaner'
  gem 'rb-fsevent'
  gem 'poltergeist'
  gem 'acts_as_fu'
  gem "show_me_the_cookies"
  gem 'simplecov', :require => false
end