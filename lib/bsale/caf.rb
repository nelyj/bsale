module Bsale
  class Caf < Base
    def where(*args)
      allowed = %i[
        codesii
        documenttypeid
        nextnumber
      ]

      query = ''
      aux = 0

      args.each do |h|
        h.each do |key, value|
          raise StandardError, "#{key} is not allowed attribute in Bsale" unless allowed.include?(key)

          query += aux.zero? ? "?#{key}=#{value}" : "&#{key}=#{value}"
          aux += 1
        end
      end

      Bsale.response('document_types/caf', self, options: query)
    end

    def attributes
      %i(
        error
        codesii
        documenttypeid
        nextnumber
        startDate
        expirationDate
        startNumber
        endNumber
        lastNumberUsed
        numbersAvailable
        expired
      )
    end
  end
end
