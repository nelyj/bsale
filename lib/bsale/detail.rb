module Bsale
  class Detail < Base
    def find(document_id:)
      Bsale.response("documents/#{document_id}/details", self)
    end

    def attributes
      %i(
        href
        id
        lineNumber
        totalUnitValue
        netAmount
        taxAmount
        totalAmount
        netDiscount
        totalDiscount
        variant
        note
        netUnitValue
        quantity
        taxId
        comment
        discount
      )
    end
  end
end
