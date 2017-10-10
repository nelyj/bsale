module Bsale
  class Detail < Base
    attr_accessor :warehouse

    def initialize(opts = {}, warehouse = false)
      @warehose = warehouse
      set_values(attrs.merge(opts))
    end

    def attrs
      if @warehouse
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
