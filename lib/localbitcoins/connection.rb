require 'json'
require 'faraday'
require 'openssl'
require 'byebug'

module Localbitcoins
  module Connection

    private

    def connection(options = {})
      apiauth_nonce = nonce
      options = {
        headers: {
          'Accept' => "application/json; charset=utf-8",
          'User-Agent' => user_agent,
          'Apiauth-Key' => hmac_key,
          'Apiauth-Nonce' => apiauth_nonce,
          'Apiauth-Signature' => signature(endpoint, apiauth_nonce)
        },
        url: base_uri,
        proxy: proxy
      }
      
      Faraday::Connection.new(options) do |connection|
        # connection.use Faraday::Request::Multipart
        connection.use Faraday::Request::UrlEncoded
        # connection.use Faraday::Response::ParseJson
        # connection.use
        connection.adapter(adapter)
      end
    end

    def nonce
      Time.now.to_i.to_s
    end

    def signature(endpoint, apiauth_nonce)
      url = URI(base_uri + endpoint) 
      message = apiauth_nonce.to_s + hmac_key + url.path + url.query.to_s

      OpenSSL::HMAC.hexdigest('SHA256', hmac_secret.encode('utf-8'), message.encode('utf-8')).upcase
    end
  end
end
