require 'json'
require 'faraday'
require 'openssl'
require 'byebug'

module Localbitcoins
  module Connection
    private

    def connection(options = {})
      options = {
        headers: {
          'Accept' => "application/json; charset=utf-8",
          'User-Agent' => user_agent,
          'Apiauth-Key' => hmac_key
        },
        url: base_uri,
        proxy: proxy
      }
      
      Faraday::Connection.new(options) do |connection|
        # connection.use Faraday::Request::Multipart
        connection.use Faraday::Request::UrlEncoded
        connection.request :url_encoded
        # connection.use Faraday::Response::ParseJson
        # connection.use
        connection.adapter(adapter)
      end
    end
  end
end
