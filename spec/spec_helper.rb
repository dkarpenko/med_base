require 'rubygems'
require 'spork'
#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  if !ENV['DRB'] && ENV['COVERAGE']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'mongoid-rspec'
  require 'rspec/autorun'
  require 'factory_girl'

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

  require 'database_cleaner'

  RSpec.configure do |config|
    config.order = "random"

    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.orm = "mongoid"

    config.before(:each) do
      DatabaseCleaner.clean
    end

  end


end

Spork.each_run do
  if ENV['DRB'] && ENV['COVERAGE']
    require 'simplecov'
    SimpleCov.start 'rails'
  end

end

Spork.after_each_run do
end