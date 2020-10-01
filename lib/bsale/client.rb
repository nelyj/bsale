module Bsale
  #code: Rut del cliente (String).
  #city: Ciudad del cliente (String).
  #company: Razón social del cliente (String).
  #municipality: Comuna del cliente (String).
  #activity: Giro del cliente (String).
  #address: Dirección del cliente (String).
  class CodeIsNull < StandardError; end
  class Client < Base
    def all
      Bsale.response('clients', self)
    end

    def where(limit: 100, offset: 0, code: nil)
      raise CodeIsNull, 'you must to pass code' if code.to_s.empty?

      Bsale.response('clients', self, options: "?limit=#{limit}&offset=#{offset}&code=#{code}")
    end

    def attributes
      %i(
        href
        id
        state
        points
        pointsUpdated
        sendDte
        prestashopClienId
        createdAt
        updatedAt
        contacts
        attributes
        addresses
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
