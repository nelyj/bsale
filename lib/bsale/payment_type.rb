module Bsale
  class PaymentType < Base

    def all
      Bsale.response('payment_types', self)
    end

    def find(id:)
      id = id.to_i
      raise 'You must need to pass an ID' if id.zero?
      Bsale.response("payment_types/#{id}", self)
    end

    def attributes
      %i(
        href
        id
        name
        isVirtual
        isCheck
        maxCheck
        isCreditNote
        isClientCredit
        isCash
        isCreditMemo
        state
        maxClientCuota
        ledgerAccount
        ledgerCode
        isAgreementBank
        agreementCode
        dynamic_attributes
      )
    end
  end
end
