module Bsale
  class Client < Base
    def initialize(opts = {})
      set_values(attrs.merge(opts))
    end

    def attrs
      default = { code: "1-9", city: "ciudad", company: "empresa", municipality: "comuna", activity: "giro", address: "direccion" }
    end

    def set_values(opts = {})
      opts.each do |k,v|
        singleton_class.send(:attr_accessor, k)
        instance_variable_set("@#{k}", v)
      end
    end
  end
end
