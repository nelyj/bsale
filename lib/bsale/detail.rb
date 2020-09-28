module Bsale
  class Detail < Base
    def attributes
      %i(
        netUnitValue
        quantity
        taxId
        comment
        discount
      )
    end
  end
end
