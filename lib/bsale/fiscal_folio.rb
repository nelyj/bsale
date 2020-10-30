module Bsale
  class FiscalFolio < Base
    def availables_by(*args)
      allowed = %i[
        codesii
        documenttypeid
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

      Bsale.response('document_types/number_availables', self, options: query)
    end

    def attributes
      %i(
        numbers_available
        last
      )
    end
  end
end
