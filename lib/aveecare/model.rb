# frozen_string_literal: true

require "date"
require "time"

module Aveecare
  # Namespace of the generated models and enums.
  module Models; end

  # @api private
  module Serialize
    module_function

    def dump(value, of = nil)
      case value
      when Symbol then value.to_s
      when Model then value.to_h
      when Time then value.getutc.iso8601(3)
      when Date then value.iso8601
      when Array then value.map { |item| dump(item, of) }
      when Hash then dump_hash(value, of)
      else value
      end
    end

    def dump_hash(value, of)
      klass = of.is_a?(String) ? Aveecare::Models.const_get(of) : of
      return klass.to_wire(value) if klass

      value.each_with_object({}) { |(k, v), out| out[k.to_s] = dump(v) }
    end
  end

  # Base class of every generated model.
  #
  # Models are plain objects with snake_case readers (+patient.first_name+). Each
  # class knows its JSON field names, so #to_h gives the camelCase JSON the API
  # speaks, and #raw holds the JSON exactly as the API returned it.
  class Model
    Attribute = Struct.new(:name, :wire, :of, :list, keyword_init: true)

    class << self
      # @api private
      def attributes
        @attributes ||= {}
      end

      # @api private
      def attribute(name, wire, of: nil, list: false)
        attributes[name] = Attribute.new(name: name, wire: wire, of: of, list: list)
        define_method(name) { @values[name] }
      end

      # Build a model from API JSON. Unknown fields are kept in #raw.
      def from_hash(data)
        new(data)
      end

      # @api private
      # Converts a Hash (snake_case or camelCase keys, symbols or strings) or a
      # model into the camelCase JSON the API expects.
      def to_wire(value)
        return value.to_h if value.is_a?(Model)
        return Serialize.dump(value) unless value.is_a?(Hash)

        by_name = {}
        attributes.each_value do |attr|
          by_name[attr.name.to_s] = attr
          by_name[attr.wire] = attr
        end
        value.each_with_object({}) do |(key, item), out|
          attr = by_name[key.to_s]
          raise ArgumentError, "unknown attribute #{key.inspect} for #{name}" unless attr

          out[attr.wire] = Serialize.dump(item, attr.of)
        end
      end
    end

    # @return [Hash] the JSON object exactly as the API returned it (empty for models you built)
    attr_reader :raw

    def initialize(data = {})
      data = data.to_h { |k, v| [k.to_s, v] } if data.is_a?(Hash)
      @raw = data.is_a?(Hash) ? data : {}
      @values = {}
      self.class.attributes.each_value do |attr|
        @values[attr.name] = decode(attr, @raw[attr.wire])
      end
      freeze
    end

    # @return [Hash] the model as API JSON (camelCase field names)
    def to_h
      self.class.attributes.each_value.with_object({}) do |attr, out|
        out[attr.wire] = Serialize.dump(@values[attr.name], attr.of)
      end
    end

    def ==(other)
      other.class == self.class && other.to_h == to_h
    end
    alias eql? ==

    def hash
      [self.class, to_h].hash
    end

    def inspect
      shown = @values.compact.map { |k, v| "#{k}=#{v.inspect}" }
      "#<#{self.class.name}#{' ' unless shown.empty?}#{shown.join(' ')}>"
    end

    private

    def decode(attr, value)
      return value if value.nil? || attr.of.nil?

      klass = attr.of.is_a?(String) ? Aveecare::Models.const_get(attr.of) : attr.of
      if attr.list
        if value.is_a?(Array)
          value.map { |item| item.is_a?(Hash) ? klass.from_hash(item) : item }
        else
          value
        end
      else
        value.is_a?(Hash) ? klass.from_hash(value) : value
      end
    end
  end
end
