# frozen_string_literal: true

ENV["RACK_ENV"] = "test"

require 'rubygems'
require 'sinatra'
require 'factory_bot'
require 'bundler/setup'
require 'dotenv'
require 'require_all'

Bundler.require(:default)

Dotenv.load
Rabl.register!
Rabl.configure do |config|
  config.include_json_root = true
  config.include_child_root = true
end

configure do
  require_all 'app'
end

Wompi::RApi.configure do |config|
  config.pub_key = "pub_test_luvUkJJNhQfFAFBbLI5lQ3wM21uUWHu3"
  config.prv_key = "prv_test_RR5BJj9jq09nI20CjVxtigMHcg2e4fnm"
  config.webhook = "https://ride_or_drive.ngrok.io/wompi_webhook"
  config.sandbox = true
end

abort('The Rails environment is running in production mode!') if production?

begin
  ActiveRecord::Migration.maintain_test_schema!
  puts "=====> SCHEMA OK"
rescue ActiveRecord::PendingMigrationError => e
  puts "=====> ERROR"
  puts e.to_s.strip
  exit 1
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups

  config.include FactoryBot::Syntax::Methods

  config.before(:suite) do
    FactoryBot.find_definitions
  end

  config.disable_monkey_patching!

  # config.before(:suite) do
  #   DatabaseCleaner.clean_with :truncation, except: %w(ar_internal_metadata)
  # end
  #
  # config.before(:each) do
  #   DatabaseCleaner.strategy = :transaction
  # end
  #
  # config.before(:each) do
  #   DatabaseCleaner.start
  # end
  #
  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end
end
