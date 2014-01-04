source  'https://rubygems.org'
ruby '2.1.0'

gem 'rails', '4.0.2'
gem 'mongoid'
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails', :require => false
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'mongoid-rspec', :require => false
  gem 'database_cleaner', :require => false
end

group :development, :test do
  gem 'better_errors'
  gem 'rspec-rails'
  gem 'simplecov'
end

gem 'devise', '>= 2.1.2'

# JavasScript libs
gem 'jquery-rails'
gem 'modernizr-rails'

# Heroku deployment requirements
group :production do
  gem 'newrelic_rpm'
   #gem 'therubyracer'
   #gem 'pg'
end


gem 'haml-rails'
gem 'haml'
gem 'hpricot'
gem 'ruby_parser'

# Pagination gems
gem 'will_paginate_mongoid'
gem 'bootstrap-will_paginate'

# Table Sorting
gem 'jquery-tablesorter'

gem 'rack-methodoverride-with-params'
