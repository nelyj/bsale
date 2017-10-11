module Bsale
  class Tax < Base
    attr_accessor :limit, :offset, :version

    def initialize(opts = {})
      set_values(attrs.merge(opts))
      @connection = Faraday.new("#{BASE_URL}#{Bsale.config.version}/")
      @connection.headers = Bsale.config.headers
    end

    def find(opts = {})
      raise "You must need to pass an ID" if opts[:id].nil?
      response = @connection.get "documents/#{opts[:id]}/details#{Bsale.config.extension}"
      JSON.parse(response.body)
    end

    def all(opts = {})
      response = @connection.get "taxes#{Bsale.config.extension}"
    end

    def attrs
      { id: nil, name: nil, percentage: nil, forAllProducts: nil,
        ledgerAccount: nil, code: nil, state: nil }
    end

    def set_values(opts = {})
      opts.each do |k,v|
        singleton_class.send(:attr_accessor, k)
        instance_variable_set("@#{k}", v)
      end
    end
  end
end
