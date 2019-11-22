module Helpers
  def valid_hmac
    $stderr.puts "Please set valid_token to ENV['HMAC_KEY'] and ENV['HMAC_SECRET']" if (ENV['HMAC_KEY'].nil? || ENV['HMAC_SECRET'].nil?)
    @hmac_key ||= ENV['HMAC_KEY']
    @hmac_secret ||= ENV['HMAC_SECRET']
  end

  def valid_client
    valid_hmac
    @valid_client ||= Localbitcoins::Client.new(hmac_key: @hmac_key, hmac_secret: @hmac_secret)
  end

  def valid_response
    include({ 'ok' => true })
  end
end
