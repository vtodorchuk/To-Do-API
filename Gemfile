# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.8'

gem 'bootsnap', '>= 1.4.4', require: false
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rails', '~> 6.1.7'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'fasterer', '~> 0.10.0'
  gem 'ffaker', '~> 2.21'
  gem 'rubocop', '~> 1.35', '>= 1.35.1'
  gem 'rubocop-performance', '~> 1.14', '>= 1.14.3'
  gem 'rubocop-rails', '~> 2.15', '>= 2.15.2'
  gem 'rubocop-rspec', '~> 2.12', '>= 2.12.1'
end

group :development do
  gem 'listen', '~> 3.3'
end

group :test do
  gem 'dox', require: false
  gem 'rspec', '~> 3.12'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'simplecov', '~> 0.21.2'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
