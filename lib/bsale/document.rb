module Bsale
  class Document < Base
    def all
      Bsale.response('documents', self)
    end

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
        href
        id
        generationDate
        number
        totalAmount
        netAmount
        taxAmount
        exemptAmount
        notExemptAmount
        exportTotalAmount
        exportNetAmount
        exportTaxAmount
        exportExemptAmount
        commissionRate
        commissionNetAmount
        commissionTaxAmount
        commissionTotalAmount
        percentageTaxWithheld
        purchaseTaxAmount
        purchaseTotalAmount
        address
        municipality
        city
        urlTimbre
        ted
        urlPublicView
        urlPdf
        urlPublicViewOriginal
        urlPdfOriginal
        token
        state
        urlXml
        salesId
        informedSii
        responseMsgSii
        document_type
        office
        user
        coin
        document_taxes
        sellers
        attributes
        sale_condition
      )
    end
  end
end
