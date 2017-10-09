module Bsale
  class Document < Base
    attr_accessor :limit, :offset, :version

    def initialize(opts = {})
      @connection = Faraday.new("#{BASE_URL}#{Bsale.config.version}/")
      @connection.headers = Bsale.config.headers
    end

    def all(opts = {})
      response = @connection.get "documents#{Bsale.config.extesion}"
      JSON.parse(response.body)
    end
  end
end
