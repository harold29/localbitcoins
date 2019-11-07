require 'byebug'

module Localbitcoins
  module Request

    def get(path, options = {})
      request(:get, path, options)
    end

    def post(path, options = {})
      request(:post, path, options)
    end

    private

    def nonce
      Time.now.to_i.to_s
    end

    def signature(endpoint, apiauth_nonce)
      url = URI(base_uri + endpoint)
      message = apiauth_nonce.to_s + hmac_key + url.path + url.query.to_s

      OpenSSL::HMAC.hexdigest('SHA256', hmac_secret.encode('utf-8'), message.encode('utf-8')).upcase
    end

    def sign_request(endpoint, request)
      apiauth_nonce = nonce
      request.headers['Apiauth-Nonce'] = apiauth_nonce
      request.headers['Apiauth-Signature'] = signature(endpoint, apiauth_nonce)
    end

    def request(method, path, options)
      response = connection.send(method) do |request|
        sign_request(path, request)
        case method
        when :get
          request.url(path, options)
        when :post
          request.path = path
          request.body = options unless options.empty?
        end
      end
      return response.body
    end
  end
end
