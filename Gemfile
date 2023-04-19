source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "rails", "~> 7.0.4", ">= 7.0.4.3"
gem "pg", "~> 1.1"
gem "puma", "~> 5.0"
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
gem "bootsnap", require: false
gem "rack-cors"
gem "sentry-ruby"
gem 'dry-validation', '~> 1.10'
gem 'api-versions', '~> 1.2', '>= 1.2.1'
gem 'jsonapi-serializer', '~> 2.2'
gem 'faraday', '~> 2.7', '>= 2.7.4'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rspec-rails', '~> 6.0', '>= 6.0.1'
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  gem 'spring'
  gem 'rubocop', require: false
end

