module Bsale
  class Document < Base
    def attributes
      %i(
        documentTypeId
        officeId
        priceListId
        emissionDate
        expirationDate
        declareSii
        codeSii
        sendEmail
        details
        client
        references
        payments
        dynamicAttributes
      )
    end
  end
end
