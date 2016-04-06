ENV['RACK_ENV'] = 'test'

require File.join(File.dirname(__FILE__), '..', 'app/controller.rb')

require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'data_mapper'
require 'database_cleaner'
require_relative 'support/wait_for_ajax.rb'
require_relative '../app/models/space.rb'
require_relative 'helpers'
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist

Capybara.app = SpaceBnB

RSpec.configure do |config|
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each, type: :feature) do
    driver_shares_db_connection_with_specs = Capybara.current_driver == :rack_test
    if !driver_shares_db_connection_with_specs
      DatabaseCleaner.strategy = :truncation
    end
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.append_after(:each) do
    DatabaseCleaner.clean
  end
end
