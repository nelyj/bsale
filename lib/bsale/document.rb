module Bsale
  class Document < Base
    def all
      Bsale.response('documents', self)
    end

    def where(limit: 100, offset: 0, client_code: nil)
      raise ClientCodeIsNUll, 'you must to pass client_code' if client_code.to_s.empty?

      Bsale.response('documents', self, options: "?limit=#{limit}&offset=#{offset}&clientcode=#{client_code}")
    end

    def count_all
      object = Bsale.response('documents/count', self)
      object.count
    end

    def create
      Bsale.response('documents', self, method: :post)
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
        reference
      )
    end
  end
end
