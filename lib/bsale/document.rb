module Bsale
  # documentTypeId:  Id del tipo de documento que indicara si es factura, boleta, nota de venta etc. (Integer).
  # officeId:  Id de la sucursal donde se emite el documento, si no es especificada el documento quedara asignado a la sucursal por defecto del sistema (Integer).
  # priceListId: Id de la lista de precio utilizada por el documento, si no es especificada se utilizara la lista de precio por defecto de la sucursal (Integer).
  # emissionDate: Fecha de emisión del documento, se envía en formato GMT (Integer).
  # expirationDate: Fecha vencimiento del documento, se envía en formato GMT (Integer).
  # declareSii:  Si se desea declarar el documento al Servicio de impuestos internos se envía 1, en caso contrario un 0 (Boolean).
  # codeSii(opcional): Opcionalmente puedes utilizar el parámetro codeSii en vez de documentTypeId si conoces el código tributario del documento.
  # client: Bsale::Client object.to_hash
  # details: Bsale::Detail object.to_hash
  # payments: Bsale::Payment object.to_hash
  # references: Bsale::Reference object.to_hash
  # dynamicAttributes: Bsale::DinamicAttributes object.to_hash
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
      response = @connection.post "documents#{Bsale.config.extension}", opts.to_json
      JSON.parse(response.body)
    end

    def attrs
      { documentTypeId: nil, officeId: nil, emissionDate: nil, expirationDate: nil,
        declareSii: nil, priceListId: nil, client: nil, details: nil, payment: nil,
        references: nil, dynamicAttributes: nil }
    end

    def set_values(opts = {})
      opts.each do |k,v|
        singleton_class.send(:attr_accessor, k)
        instance_variable_set("@#{k}", v)
      end
    end
  end
end
