module Bsale
  class PriceList < Base
    def all
      Bsale.response('price_lists', self)
    end

    def attributes
      %i(
        href
        id
        name
        state
        coin
        details
        description
        error
      )
    end
  end
end
