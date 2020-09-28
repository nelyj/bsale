module Bsale
  class DteCode < Base
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
