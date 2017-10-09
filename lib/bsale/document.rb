module Bsale
  class Document < Base
    attr_accessor :limit, :offset, :version

    def initialize(opts = {})
      @connection = Faraday.new("#{BASE_URL}#{Bsale.config.version}/")
      @connection.headers = Bsale.config.headers
    end

    def all(opts = {})
      response = @connection.get "documents#{Bsale.config.extension}"
      JSON.parse(response.body)
    end

    def summary(opts = {})
      response = @connection.get "documents/summary#{Bsale.config.extension}"
      JSON.parse(response.body)
    end
  end
end
