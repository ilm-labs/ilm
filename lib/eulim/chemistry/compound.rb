module Eulim::Chemistry
	class Compound

		VALID_COMPOUND_REGEXP = /[A-Z][a-z]{0,2}\d*|\((?:[^()]*(?:\(.*\))?[^()]*)+\)\d*/

		attr_accessor :molecular_mass, :constituents, :formula, :constituent_element_symbols_count
		
		def initialize(arg)
			@formula = arg
			@constituents = get_constituents
			@molecular_mass = get_molecular_mass
			@constituent_element_symbols_count = get_constituent_element_symbols_count
		end

		private

			def get_constituent_element_symbols_count formula=@formula, result={}
				constituents = formula.scan VALID_COMPOUND_REGEXP
				constituents.each do |constituent|
					multipler = get_multipler constituent
					if constituent[0] != '(' && multipler == 0
						result[constituent] = result[constituent] ? result[constituent] + 1 : 1
					else
						(multipler == 0 ? 1 : multipler).times do
							sub_constituents = constituent.match(/^\(?(.*?)\)?($|\d*$)/).to_a
							idx = constituent == sub_constituents.first ? 1 : 0
							get_constituent_element_symbols_count sub_constituents[idx], result
						end
					end	
				end
				result
			end

			def get_molecular_mass
				mass = 0
				@constituents.each do |constituent|
					mass += constituent[:element].atomic_mass * constituent[:atom_count]
				end
				mass
			end

			def get_constituents
				constituents = []
				get_constituent_element_symbols_count.each do |symbol, count|
					constituents << {element: Element.get_by_symbol(symbol), atom_count: count}
				end
				constituents
			end


			def get_multipler constituent
				multipler = constituent.match(/\d*$/).to_a.first.to_i
			end

	end
end
