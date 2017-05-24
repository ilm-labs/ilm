module Eulim::Chemistry
	class Compound

		VALID_COMPOUND_REGEXP = /[A-Z][a-z]{0,2}\d*|\((?:[^()]*(?:\(.*\))?[^()]*)+\)\d*/

		def initialize(arg)
			@formula = arg
			@constituent_atoms = get_constituent_atoms
		end

		def molecular_mass
			mass = 0
			@constituent_atoms.each do |symbol, count|
				mass += Element.get_by_symbol(symbol).atomic_mass * count
			end
			mass
		end

		def elements
			elements = []
			@constituent_atoms.each do |symbol, count|
				elements << {element: Element.get_by_symbol(symbol), atom_count: count}
			end
			elements
		end

		private
			def get_constituent_atoms formula=@formula, result={}
				constituents = formula.scan VALID_COMPOUND_REGEXP
				constituents.each do |constituent|
					multipler = get_multipler constituent
					if constituent[0] != '(' && multipler == 0
						result[constituent] = result[constituent] ? result[constituent] + 1 : 1
					else
						(multipler == 0 ? 1 : multipler).times do
							sub_constituents = constituent.match(/^\(?(.*?)\)?($|\d*$)/).to_a
							idx = constituent == sub_constituents.first ? 1 : 0
							get_constituent_atoms sub_constituents[idx], result
						end
					end	
				end
				result
			end

			def get_multipler constituent
				multipler = constituent.match(/\d*$/).to_a.first.to_i
			end

	end
end
