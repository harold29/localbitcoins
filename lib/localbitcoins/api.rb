require './localbitcoins/connection'
require './localbitcoins/configuration'
require './localbitcoins/request'

module Localbitcoins
  class API
    attr_accessor(*Configuration::VALID_OPTIONS_KEYS)

    def initialize(options = {})
      options = Localbitcoins.options.merge(options)
      Configuration::VALID_OPTIONS_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Connection
    include Request
    

  end
end
