module Bsale
  class Payment < Base
    def initialize(opts = {})
      set_values(attrs.merge(opts))
    end

    def attrs
      { paymentTypeId: 0, amount: 0, recordDate: 0 }
    end

    def set_values(opts = {})
      opts.each do |k,v|
        singleton_class.send(:attr_accessor, k)
        instance_variable_set("@#{k}", v)
      end
    end
  end
end
