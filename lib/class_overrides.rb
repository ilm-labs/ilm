# Custom enhancements
class Class
  def humanized_name
    to_s.split('::').last.humanize
  end
end
