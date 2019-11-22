require 'simplecov'
SimpleCov.start

require 'webmock/rspec'
require 'vcr'

require "bundler/setup"
require "localbitcoins"

require_relative "./helpers.rb"

include Helpers 

WebMock.disable_net_connect!(allow_localhost: true)

VCR.configure do |config|
  config.cassette_library_dir = 'spec/vcr'
  config.hook_into :webmock
  config.allow_http_connections_when_no_cassette = true
  config.default_cassette_options = { :record => :new_episodes }
  config.configure_rspec_metadata!
  config.filter_sensitive_data("<HMAC>") { valid_hmac }
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
