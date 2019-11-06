require_relative "localbitcoins/api"
require_relative "localbitcoins/client"
require_relative "localbitcoins/configuration"
require_relative "localbitcoins/version"

module Localbitcoins
  extend Configuration

  def self.client(options = {})
    Localbitcoins::Client.new(options)
  end
end
