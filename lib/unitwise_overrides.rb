require 'unitwise'

module Unitwise
  # Adding dot operators to unitwise
  class Measurement
    private_class_method :method_missing
    def method_missing(m, *args)
      super if m.to_s.include?('_')

      self * new(1, m.to_s)
    rescue StandardError
      super
    end
  end
end
