source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.10'

gem 'rails', '~> 6.1.7'
gem 'devise', '~> 4.8', '>= 4.8.1'
gem 'jwt', '~> 2.2', '>= 2.2.1'
gem 'jwt_sessions', '~> 2.7', '>= 2.7.4'
gem 'pry', '~> 0.13.1'
gem 'redis', '~> 4.1', '>= 4.1.3'
gem 'redis-rails', '~> 5.0', '>= 5.0.2'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'dox', require: false
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
  gem 'spring'
end

group :test do
  gem 'rspec', '~> 3.12'
  gem 'rspec-rails', '~> 5.1', '>= 5.1.2'
  gem 'simplecov', '~> 0.21.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
