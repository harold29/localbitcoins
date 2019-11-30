require './lib/localbitcoins/connection'
require './lib/localbitcoins/configuration'
require './lib/localbitcoins/error'
require './lib/localbitcoins/request'
require './lib/localbitcoins/endpoint'

module Localbitcoins
  class API
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options = {})
      raise Localbitcoins::MissingKey if options[:hmac_key].nil? || options[:hmac_secret].nil?

      options = Localbitcoins.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Connection
    include Request
    include Endpoint
  end
end
