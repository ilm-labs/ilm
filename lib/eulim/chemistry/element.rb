require 'csv'

module Eulim
  module Chemistry
    # This class has functionality for elements
    # Ex: symbol, atomic mass, atomic number
    class Element

      attr_accessor :atomic_mass, :symbol, :name, :atomic_number

      @@attrs = %w[symbol name atomic_number atomic_mass]
      # Data taken from 'www.science.co.il/elements/'
      @@array = Array.new
      
      def initialize(arg)
        @name = arg[1].to_s.strip
        @symbol = arg[0].to_s.strip
        @atomic_number = arg[2].to_s.strip
        @atomic_mass = arg[3].to_s.strip
      end
      
      CSV.foreach(File.join(File.dirname(__FILE__), "elements.csv"), headers: true) do |row|
        @@array << new(row)
      end

      private_class_method def self.method_missing(m, *args)
        attribute = m.to_s.split('get_by_').last
        valid_method? m, attribute
        raise  'please give argument' unless !args.empty?
        args[0] = attribute == 'name' ? args[0].capitalize : args[0]
        element_data = get_element_by_attribute attribute, args[0]
        raise 'Element not found' unless element_data
        element_data
      end
      
      private_class_method def self.get_element_by_attribute(attribute, value)
        @@array.each do |element|
          if element.instance_variable_get(("@"+attribute).intern) == value  ## elements value of attribute == value give by user
            return element
          end
        end
        raise(NameError, 'element not found')
      end

      private_class_method def self.valid_method?(m, attribute)
        super unless m.to_s.start_with?('get_by_')
        raise(NameError, 'Invalid attribute') unless @@attrs.include? attribute
      end

      private_class_method :new
    end
  end
end
