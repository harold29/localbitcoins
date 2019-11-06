require 'faraday'
require './lib/localbitcoins/version.rb'

module Localbitcoins
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :base_uri,
      :endpoint,
      :middlewares,
      :user_agent,
      :hmac_key,
      :hmac_secret,
      :proxy
    ].freeze

    DEFAULT_ADAPTER = Faraday.default_adapter

    DEFAULT_BASE_URI = 'https://localbitcoins.com/api/'.freeze

    DEFAULT_ENDPOINT = ''

    DEFAULT_USER_AGENT = "Localbitcoins Ruby Gem #{Localbitcoins::VERSION}".freeze

    DEFAULT_MIDDLEWARES = []

    DEFAULT_HMAC_KEY = ''

    DEFAULT_HMAC_SECRET = ''

    DEFAULT_PROXY = nil

    attr_accessor *VALID_OPTIONS_KEYS

    def self.extended(base)
      base.reset
    end

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEYS.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

    def reset
      self.adapter = DEFAULT_ADAPTER
      self.base_uri = DEFAULT_BASE_URI
      self.endpoint = DEFAULT_ENDPOINT
      self.middlewares = DEFAULT_MIDDLEWARES
      self.user_agent = DEFAULT_USER_AGENT
      self.hmac_key = DEFAULT_HMAC_KEY
      self.hmac_secret = DEFAULT_HMAC_SECRET
      self.proxy = DEFAULT_PROXY
    end

  end
end
