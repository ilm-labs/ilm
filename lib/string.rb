# Custom enhancements
class String
  def underscore
    gsub(/::/, '/')
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      .tr('-', '_')
      .downcase
  end

  def humanize(options = { capitalize: true })
    s = underscore.tr('_', ' ')
    s = s.capitalize if options[:capitalize]
    s
  end
end
