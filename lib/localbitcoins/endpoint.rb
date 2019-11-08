require './lib/localbitcoins/endpoint/account'
require './lib/localbitcoins/endpoint/wallet'

module Localbitcoins
  module Endpoint
    include Account
    include Wallet
  end
end
