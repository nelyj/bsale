module Bsale
  class Detail < Base
    def initialize(opts = {}, warehouse = false)
      set_values(attrs(warehouse).merge(opts))
    end

    def attrs(option)
      if option
        { variantId: 0, netUnitValue: 0, quantity: 0, taxId: "", comment: "", discount: 0 }
      else
        { netUnitValue: 0, quantity: 1, taxId: "", comment: "", discount: 0 }
      end
    end

    def set_values(opts = {})
      opts.each do |k,v|
        singleton_class.send(:attr_accessor, k)
        instance_variable_set("@#{k}", v)
      end
    end
  end
end
