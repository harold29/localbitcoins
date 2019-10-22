require "localbitcoins/version"

module Localbitcoins
  
  @app_info = nil

  @api_base = 'https://localbitcoins.com'

  class << self
    attr_accessor :apiauth_key
    attr_accessor :apiauth_nonce
    attr_accessor :apiauth_signature

    attr_reader :api_base

    def self.app_info
      @app_info
    end

    def self.app_info=(info)
      @app_info = info
    end

    def self.api_base=(api_base)
      @api_base = api_base
    end
  end

  class Error < StandardError; end
  # Your code goes here...
end
