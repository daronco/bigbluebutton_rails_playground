source 'http://rubygems.org'

gem "rails", "~> 3.2.0"

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', '~> 3.2.0'
  gem 'coffee-rails', '~> 3.2.0'
  gem 'uglifier', '>= 1.0.3'
  gem 'yui-compressor'
  gem 'compass-rails', '~> 1.0'

  # TODO: remove when compass-rails is updated
  # This compass is here so we can have css3/animation
  # gem 'compass', '~> 0.13.alpha'
end

gem 'jquery-rails'
gem 'therubyracer', :require => 'v8'
gem 'haml'
# gem 'json'

gem 'devise'
gem 'simple_form', '~> 2.0.0'
gem 'configatron'
gem 'mysql2', '~> 0.3.0'

gem 'bigbluebutton_rails', :git => 'git://github.com/mconf/bigbluebutton_rails.git'
gem 'bigbluebutton-api-ruby', :git => 'git://github.com/mconf/bigbluebutton-api-ruby.git'

group :development do
  gem 'sqlite3'
  gem 'rails_best_practices'
end

group :test, :development do
  gem 'rspec-rails'
end

group :test do
  gem 'rspec-instafail'
  gem 'fuubar'
  gem 'shoulda-matchers'
  gem 'cucumber-rails', :require => false
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'forgery'

  if RUBY_VERSION >= "1.9"
    gem 'simplecov', '>= 0.4.0', :require => false
  end
end
