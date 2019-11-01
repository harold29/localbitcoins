require 'faraday'

module Localbitcoins
  module Configuration
    VALID_OPTIONS_KEYS = [
      :adapter,
      :base_uri,
      :endpoint,
      :middlewares,
      :hmac_key,
    ].freeze

    DEFAULT_ADAPTER = Faraday.default_adapter

    DEFAULT_BASE_URI = 'https://localbitcoins.com/api/'.freeze

    DEFAULT_ENDPOINT = ''

    DEFAULT_MIDDLEWARES = []

    DEFAULT_HMAC_KEY = ''

    attr_accessor *VALID_OPTIONS_KEYS

    def configure
      yield self
    end

    def options
      VALID_OPTIONS_KEY.inject({}) do |option, key|
        option.merge!(key => send(key))
      end
    end

  end
end
