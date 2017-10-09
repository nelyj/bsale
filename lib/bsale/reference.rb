module Bsale
  class Reference < Base
    def initialize(opts = {})
      set_values(attrs.merge(opts))
    end

    def attrs
      { number: "", referenceDate: 0, reason: "", codeSii: 0 }
    end

    def set_values(opts = {})
      opts.each do |k,v|
        singleton_class.send(:attr_accessor, k)
        instance_variable_set("@#{k}", v)
      end
    end
  end
end
