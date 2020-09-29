module Bsale
  class DocumentType < Base
    def all
      Bsale.response('document_types', self)
    end

    def find(id:)
      id = id.to_i
      raise 'You must need to pass an ID' if id.zero?
      Bsale.response("document_types/#{id}", self)
    end

    def attributes
      %i(
        href
        id
        initialNumber
        codeSii
        isElectronicDocument
        breakdownTax
        use
        isSalesNote
        isExempt
        restrictsTax
        useClient
        messageBodyFormat
        thermalPrinter
        state
        copyNumber
        isCreditNote
        continuedHigh
        name
        ledgerAccount
        ipadPrint
        ipadPrintHigh
        restrictClientType
        book_type
      )
    end
  end
end
