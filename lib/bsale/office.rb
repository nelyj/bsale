module Bsale
  class Office < Base
    def attributes
      %i(
        href
        id
        name
        description
        address
        latitude
        longitude
        isVirtual
        country
        municipality
        city
        zipCode
        costCenter
        state
        imagestionCellarId
      )
    end
  end
end
