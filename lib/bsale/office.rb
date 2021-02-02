module Bsale
  class Office < Base
    def all
      Bsale.response('offices', self)
    end

    def find(id:)
      id = id.to_i
      raise 'You must need to pass an ID' if id.zero?
      Bsale.response("offices/#{id}", self)
    end

    def create
      Bsale.response('offices', self, method: :post)
    end

    def update
      Bsale.response("offices/#{self.id}", self, method: :put)
    end

    def attributes
      %i(
        href
        id
        name
        description
        email
        address
        latitude
        longitude
        isVirtual
        country
        municipality
        city
        zipCode
        costCenter
        state
        imagestionCellarId
        defaultPriceList
        error
      )
    end
  end
end
