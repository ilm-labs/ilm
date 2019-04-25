require 'unitwise'

# Adding unitwise functionality to Numerics
class Numeric
  private_class_method :method_missing
  def method_missing(m, *args)
    super if m.to_s.include?('_')

    Unitwise::Measurement.new(self, m.to_s)
  rescue StandardError
    super
  end
end
