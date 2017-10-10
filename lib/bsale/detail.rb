module Bsale
  #variantId:  Id de la variante que indicara cual variante es la que se esta vendiendo de la variante (Integer).
  #code:  De forma alternativa al Id, se puede utilizar el SKU de la variante (String).
  #barCode: De forma alternativa al Id, se puede utilizar el codigo de barras de la variante (String).
  #netUnitValue: Valor unitario neto de la variante, este valor es sin impuestos (Float).
  #quantity: Cantidad de la variante que se esta vendiendo (Integer).
  #taxId:  Arreglo de identificadores de los impuestos a utilizar, estos tienen que ir dentro de "[]" (String).
  #comment:  Descripción breve de la variante (String).
  #discount: Porcentaje del descuento si se desea aplicar uno. (Float).
  #
  #Es muy importante que se envíen los impuestos por cada detalle, de lo contrario el documento saldrá exento.
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
