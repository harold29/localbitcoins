module Localbitcoins
  module Endpoint
    module MarketData
      def trades(currency = '', options = {})
        get("bitcoinscharts/#{currency}/trades.json")
      end

    end
  end
end
