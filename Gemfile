source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use Puma as the app server
gem 'puma', '~> 3.12'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors', :require => 'rack/cors'
# Ancestry to work with trees
gem 'ancestry', '~> 3.0.1'
gem 'active_model_otp' #for google authenticator
# A pure ruby implementation of the RFC 7519 OAuth JSON Web Token (JWT) standard
gem 'jwt', '~> 2.0.0'
# Mailgun server api
gem 'mailgun-ruby', '~> 1.1.6'
gem 'sendgrid-ruby'
# Gem to manage http requests
gem	'httparty', '~> 0.15.6'
# Unofficial gem for the Bittrex Api
gem 'bittrex', '~> 0.0.1'
# A pure-Ruby implementation of the SSH2 client protocol
gem 'net-ssh'
# A pure Ruby implementation of the SCP client protocol
gem 'net-scp'
gem 'hirb'
gem 'erd'
gem 'paperclip', '~> 5.1'
gem 'carrierwave-base64'
gem 'active_model_serializers'
gem 'aws-sdk', '~> 3.0', '>= 3.0.1'
gem 'will_paginate'
gem 'api-pagination'
gem 'block_io'
gem 'sidekiq'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec'
  gem 'rspec_junit_formatter' 
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Use annotate for annotate models (show the columns in model.rb)
  gem 'annotate', '~> 2.7.2'
  # An IRB alternative and runtime developer console
  gem 'pry'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
end

group :production do
  # Use mysql database in deployment
  gem 'mysql2', '~> 0.4.9'
  gem 'cloudflare-rails'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
