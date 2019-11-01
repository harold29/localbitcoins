require 'faraday'
require 'json'
require 'openssl'

module Localbitcoins
  class Connection

   # attr_accessor :base_uri

   # attr_accessor :hmac_key 
   #  attr_accessor :hmac_secret

    # def initialize(hmac_key = nil, hmac_secret = nil)
    #  @hmac_key = hmac_key
    #  @hmac_secret = hmac_secret
    #  @base_uri = 'https://localbitcoins.com'
    # end

    # def get(url, data)
    #    request :get, url, data
    # end

    # def post(url, data)
    #  request :post, url, data
    # end

    # def agent
    #  @agent ||= Faraday.new(url: base_uri) do |agent|
    #    agent.request  :url_encoded
    #    agent.response :logger do |logger|
    #      logger.filter(/(api_key=)(\w+)/,'\1[REMOVED]')
    #    end
    #    agent.adapter Faraday.default_adapter
    #    agent.options.params_encoder = Faraday::FlatParamsEncoder
    #  end
    # end

    private

    def connection(options = {})
      options = {
        headers: {
          'Accept' => "application/json; charset=utf-8",
          'User-Agent' => user_agent,
          'Apiauth-Key' => hmac_key,
          'Apiauth-Nonce' => nonce,
          'Apiauth-Signature' => signature(path)
        },
        url: endpoint
      }

      Faraday::Connection.new(options) do |connection|
        connection.use Faraday::Request::Multipart
        connection.use Faraday::Request::UrlEncoded
        connection.use Faraday::Response::ParseJson
        # connection.use
        connection.adapter(adapter)
      end
    end

    # def reset_agent
    #  @agent = nil
    # end

    # def request(method, path, data)
    #  @agent.send(method, path) do |request|
    #    request.url '/api/' + path
    #    
    #    request.headers['Apiauth-Key'] = hmac_key
    #    request.headers['Apiauth-Nonce'] = nonce
    #    request.headers['Apiauth-Signature'] = signature(path)

    #    request.options.timeout = 5

    #    request.body = data 
    #  end
    # end

    def nonce
      Time.now.to_i.to_s
    end

    def signature(endpoint)
      url = URI(base_uri + '/api/' + endpoint) 
      message = nonce.to_s + @hmac_key + url.path + url.query.to_s

      OpenSSL::HMAC.hexdigest('SHA256', @hmac_secret.encode('utf-8'), message.encode('utf-8')).upcase
    end
  end
end
