module Bsale
  class Tax < Base
    def all
      Bsale.response('taxes', self)
    end

    def find(id:)
      id = id.to_i
      raise 'You must need to pass an ID' if id.zero?
      Bsale.response("taxes/#{id}", self)
    end

    def attributes
      %i(id href name percentage forAllProducts ledgerAccount code state)
    end
  end
end
