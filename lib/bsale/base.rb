module Bsale
  class Base
    BASE_URL = 'https://api.bsale.cl/v'.freeze

    def initialize(attrs = {})
      set_values({}.merge(attrs))
    end

    def set_values(attrs = {})
      attrs.merge!(hash_attributes) if attrs.empty?

      validate_attributes!(attrs)

      attrs.each do |key, value|
        singleton_class.send(:attr_accessor, key)
        instance_variable_set("@#{key}", value)
      end
    end

    def validate_attributes!(attrs = {})
      undefined_attributes = attrs.map {|k, _v| k.to_sym } - attributes

      raise UndefinedAttributes.new "#{self.class.name} #{undefined_attributes.join(' ')}" unless undefined_attributes.length.zero?
    end

    def hash_attributes
      Hash[attributes.collect { |item| [item, nil] } ]
    end

    def to_h
      object = self
      instance_variables.each_with_object({}) do |var, hash|
        data = object.instance_variable_get(var)
        next if data.nil?
        hash[var.to_s.delete('@')] =
          if data.class.to_s.include?('Bsale')
            data.to_h
          elsif data.kind_of?(Array)
            new_array = []
            new_array = data.map do |o|
              o.to_h
            end
          else
            data
          end
      end
    end
  end
end
