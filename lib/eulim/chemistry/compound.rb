module Eulim::Chemistry
	class Compound

		VALID_COMPOUND_REGEXP = /[A-Z][a-z]{0,2}\d*|\((?:[^()]*(?:\(.*\))?[^()]*)+\)\d*/
		VAILD_ELEMENT_REGEXP = /[A-Z][a-z]{0,2}\d*/

		def initialize(arg)
			@formula = arg
		end

		def molecular_mass
			mass = 0
			element_atom_count = get_element_atom_count
			element_atom_count.each do |symbol, count|
				mass += Element.get_by_symbol(symbol).atomic_mass * count
			end
			mass
		end

		private
			def get_element_atom_count formula = @formula, group_multiplier = 1, result = {}, groups = []
				formula
				elements_n_groups = formula.scan VALID_COMPOUND_REGEXP
				loop do
					break if !elements_n_groups.last
					elements = elements_n_groups.last.scan VAILD_ELEMENT_REGEXP
					if elements.first === elements_n_groups.last
						element_multipler = elements.first.match(/\d*$/).to_a.first.to_i
						element_multipler = element_multipler > 0 ? element_multipler : 1
						element_symbol = elements.first.match(/[A-Z][a-z]{0,2}/).to_a.first
						if result[element_symbol]
							result[element_symbol] += (element_multipler * group_multiplier)
						else
							result[element_symbol] = (element_multipler * group_multiplier)
						end
					else
						groups << elements_n_groups.last
					end
					elements_n_groups.pop
				end
				loop do
					break if !groups.last
					group = groups.pop
					grml = get_group_multiplier(group)
					get_element_atom_count group[1..-(grml.to_s.length+1)], grml*group_multiplier, result, groups
				end
				result
			end

			def get_group_multiplier formula
				group_multiplier = formula.scan(VALID_COMPOUND_REGEXP).first.match(/\d*$/).to_a.first.to_i
				group_multiplier > 0 ? group_multiplier : 1
			end

	end
end
