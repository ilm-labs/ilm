require 'unitwise'

# Adding unitwise functionality to Numerics
class Numeric
  private_class_method def method_missing(m, *args)
    m = m.to_s.gsub!('__', '/').tr!('_', '.')
    Unitwise::Measurement.new(self, m.to_s.tr('_', '/'))
  rescue
    super
  end
end
