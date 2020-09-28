module Bsale
  class Connection
    BASE_URL = 'https://api.bsale.cl/v'.freeze

    def request
      conn = Faraday.new("#{BASE_URL}#{Bsale.config.version}")
      conn.headers = Bsale.config.headers

      conn
    end

    def response(url, klass, method: :get)
      res =
        if method == :get
          request.send(method, "#{url}#{Bsale.config.extension}")
        else
          request.send(method, "#{url}#{Bsale.config.extension}", klass.to_h.to_json)
        end

      data = JSON.parse(res.body)

      if data.has_key?('count') && data.keys.length > 1
        result = []
        data['items'].map do |item|
          result << klass.class.new(item)
        end
      else
        result = klass.class.new(data)
      end

      result
    rescue StandardError => e
      raise StandardError.new "#{e.to_s}"
    end
  end

  def self.response(url, klass, method: :get)
    @response = Connection.new.response(url, klass, method: method)
  end
end
