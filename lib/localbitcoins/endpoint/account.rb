module Localbitcoins
  module Endpoint
    module Account
      def myself(options = {})
        get('myself/', options)
      end

      def dashboard(options = {})
        get('dashboard/', options)
      end

      def dashboard_released(options = {})
        get('dashboard/released/', options)
      end

      def dashboard_canceled(options = {})
        get('dashboard/canceled/', options)
      end

      def dashboard_closed(options = {})
        get('dashboard/closed/', options)
      end

      def notifications(options = {})
        get('notifications/', options)
      end
    end
  end  
end
