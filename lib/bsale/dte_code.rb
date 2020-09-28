module Bsale
  class DteCode < Base
    def all
      Bsale.response('dte_codes', self)
    end

    def find(id:)
      id = id.to_i
      raise 'You must need to pass an ID' if id.zero?
      Bsale.response("dte_codes/#{id}", self)
    end

    def attributes
      %i(
        href
        id
        name
        codeSii
        state
      )
    end
  end
end
