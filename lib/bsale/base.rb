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
  end
end
