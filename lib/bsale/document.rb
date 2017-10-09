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

    def find(opts = {})
      raise "You must need to pass an ID" if opts[:id].nil?
      response = @connection.get "documents/#{opts[:id]}#{Bsale.config.extension}"
      JSON.parse(response.body)
    end

    def details(opts = {})
      raise "You must need to pass an ID" if opts[:id].nil?
      response = @connection.get "documents/#{opts[:id]}/details#{Bsale.config.extension}"
      JSON.parse(response.body)
    end

    def references(opts = {})
      raise "You must need to pass an ID" if opts[:id].nil?
      response = @connection.get "documents/#{opts[:id]}/references#{Bsale.config.extension}"
      JSON.parse(response.body)
    end

    def taxes(opts = {})
      raise "You must need to pass an ID" if opts[:id].nil?
      response = @connection.get "documents/#{opts[:id]}/document_taxes#{Bsale.config.extension}"
      JSON.parse(response.body)
    end

    def sellers(opts = {})
      raise "You must need to pass an ID" if opts[:id].nil?
      response = @connection.get "documents/#{opts[:id]}/sellers#{Bsale.config.extension}"
      JSON.parse(response.body)
    end

    def count
      response = @connection.get "documents/count#{Bsale.config.extension}"
      JSON.parse(response.body)
    end
  end
end
