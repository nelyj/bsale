module Bsale
  class Payment < Base
    def attributes
      %i(
        paymentTypeId
        amount
        recordDate
      )
    end
  end
end
