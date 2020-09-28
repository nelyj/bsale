module Bsale
  class Document < Base
    def all
      Bsale.response('documents', self)
    end

    def count_all
      object = Bsale.response('documents/count', self)
      object.count
    end

    def find(id:)
      id = id.to_i
      raise 'You must need to pass an ID' if id.zero?
      Bsale.response("documents/#{id}", self)
    end

    def attributes
      %i(
        error
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
        count
      )
    end
  end
end
