module Bsale
  class Reference < Base
    def attributes
      %i(
        number
        referenceDate
        reason
        codeSii
      )
    end
  end
end
