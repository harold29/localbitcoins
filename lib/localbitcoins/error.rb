module Localbitcoins
  class Error < StandardError; end

  class MissingKey < Error; end

  class Unauthorized < Error; end
end
