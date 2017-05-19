module Eulim::Chemistry
	class Compound
		def initialize(arg)
			@formula = arg
		end

		def constituent_elements
			elements = []
			@formula.split(/(?=[A-Z])/).each do |element_symbol|
				elements << Element.get_by_symbol(element_symbol.gsub(/(\W|\d)/, ""))
			end
			elements
		end
		
	end
end