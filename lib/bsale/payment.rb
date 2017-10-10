module Bsale
  # paymentTypeId: Id de la forma de pago utilizada en el pago del documento (Integer).
  # amount: monto del pago del documento (Integer).
  # recordDate: Fecha en la cual se realizo el pago del documento, se envía en formato GMT (Integer).
  #
  # De lo contrario Bsale detectara la forma de pago por defecto y asignara el monto total del documento a esa forma de pago.
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
