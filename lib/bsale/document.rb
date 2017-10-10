module Bsale
  class Document < Base
    attr_accessor :limit, :offset, :version

    def initialize(opts = {})
      set_values(attrs.merge(opts))
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

    def by_details(opts = {})
      raise "You must need to pass an ID" if opts[:id].nil?
      response = @connection.get "documents/#{opts[:id]}/details#{Bsale.config.extension}"
      JSON.parse(response.body)
    end

    def by_references(opts = {})
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

    def create(opts = {})
      binding.pry
      response = @connection.post "documents#{Bsale.config.extension}", opts
      JSON.parse(response.body)
    end

    def attrs
      { documentTypeId: nil, officeId: nil, emissionDate: nil, expirationDate: nil,
        declareSii: nil, priceListId: nil, client: {}, details: {}, payment: {},
        references: {}, dynamicAttributes: {} }
    end

    def set_values(opts = {})
      opts.each do |k,v|
        singleton_class.send(:attr_accessor, k)
        instance_variable_set("@#{k}", v)
      end
    end
  end
end
