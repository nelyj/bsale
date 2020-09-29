module Bsale
  #code: Rut del cliente (String).
  #city: Ciudad del cliente (String).
  #company: Razón social del cliente (String).
  #municipality: Comuna del cliente (String).
  #activity: Giro del cliente (String).
  #address: Dirección del cliente (String).
  class Client < Base
    def attributes
      %i(
        facebook
        municipality
        phone
        activity
        city
        maxCredit
        hasCredit
        accumulatePoints
        lastName
        note
        firstName
        company
        address
        email
        twitter
        code
        companyOrPerson
        isForeigner
      )
    end
  end
end
