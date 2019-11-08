module Localbitcoins
  module Endpoint
    module Wallet
      def wallet(options = {})
        get('wallet/', options)
      end

      def wallet_balance(options = {})
        get('wallet-balance/', options)
      end

      def wallet_address(options = {})
        get('wallet-addr/', options)
      end

      def fees(options = {})
        get('fees/', options)
      end

      def wallet_send(options = {})
        post('wallet-send/', options)
      end

      def wallet_send_pin(options = {})
        post('wallet-send/', options)
      end
    end
  end
end
