source 'http://rubygems.org'

gem "rails", "~> 3.1.0.rc1"
#gem "mysql2", "0.3.2"

# general purpose
gem 'devise'
gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'
gem 'configatron'

# BigBlueButton
gem 'bigbluebutton_rails', :path => "../bigbluebutton_rails/"
gem 'bigbluebutton-api-ruby', :path => "../bigbluebutton-api-ruby/"

# Rails 3.1 - Asset Pipeline
gem 'json'
gem 'sass'
gem 'coffee-script'
gem 'uglifier'
gem 'compass'

# Rails 3.1 - JavaScript
gem 'jquery-rails'
gem 'therubyracer', :require => 'v8'

# Rails 3.1 - Heroku
#group :production do
#  gem 'therubyracer-heroku', '0.8.1.pre3'
#  gem 'pg'
#end

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'rspec-rails', '~> 2.6'
  gem 'rspec-instafail'
  gem 'fuubar'
  gem 'shoulda-matchers'
  gem 'cucumber-rails', '~> 0.5.0'
  gem 'database_cleaner'
  gem 'factory_girl'
  gem 'forgery'
end
