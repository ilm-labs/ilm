require 'unitwise'

module Unitwise
  # Adding dot operators to unitwise
  class Measurement
    private_class_method :method_missing
    def method_missing(method_name, *args)
      super if method_name.to_s.include?('_')

      self * new(1, method_name.to_s)
    rescue StandardError
      super
    end
  end
end
