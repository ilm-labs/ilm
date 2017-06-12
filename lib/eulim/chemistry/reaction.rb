module Eulim::Chemistry
	class Reaction

		attr_accessor :equation, :is_valid, :is_balanced

		def initialize(arg)
			@equation = arg
			get_reactants_and_products
			@is_valid = valid_rxn?
			@is_balanced = balanced_rxn?
		end

	private
			def get_reactants_and_products reaction_string=@equation
				reactants, products = reaction_string.split(">>")
				reactants = reactants.split('+')
				products = products.split('+')

				reactants.each_with_index do |react, idx|
					react.strip!
					reactant = {}
					sc = get_stoichiometric_coeff react
					sc = sc == 0 ? 1 : sc
					if sc < 10
						reactant[:compound] = Compound.new react[0..react.length].strip
					
					else
						reactant[:compound] = Compound.new react[sc.to_s.length..react.length].strip
					end
					reactant[:stoichiometric_coeff] = sc
					reactants[idx] = reactant
				end
				products.each_with_index do |prod, idx|
					prod.strip!
					product = {}
					sc = get_stoichiometric_coeff prod
					sc = sc == 0 ? 1 : sc
					if sc < 10
						product[:compound] = Compound.new prod[0..prod.length].strip
					
					else
						product[:compound] = Compound.new prod[sc.to_s.length..prod.length].strip
					end
					product[:stoichiometric_coeff] = sc
					products[idx] = product
				end
				@reactants = reactants
				@products = products
			end

			def balanced_rxn?
				balanced_reactant={}
				@reactants.each do |reactant|
					coeff_reactant_molecule = reactant[:stoichiometric_coeff]
					reactant[:compound].constituent_element_symbols_count.each do |symbol ,count|
						balanced_reactant[symbol] =	balanced_reactant[symbol] ? balanced_reactant[symbol] + count * coeff_reactant_molecule : count * coeff_reactant_molecule
					end
				end
				balanced_product={}
				@products.each do |product|
					coeff_product_molecule = product[:stoichiometric_coeff]
					product[:compound].constituent_element_symbols_count.each do |symbol ,count|
						balanced_product[symbol] =	balanced_product[symbol] ? balanced_product[symbol] + count * coeff_product_molecule : count * coeff_product_molecule
					end
				end
				balanced_product == balanced_reactant
			end

			def valid_rxn?
				reactant_element_symbols = []
				product_element_symbols = []
				@reactants.each do |reactant|
					reactant_constituent_element_symbols_count = reactant[:compound].constituent_element_symbols_count
					reactant_constituent_element_symbols_count.each do |symbol, count|
						reactant_element_symbols << symbol unless reactant_element_symbols.include? symbol
					end
				end
				@products.each do |product|
					product_constituent_element_symbols_count = product[:compound].constituent_element_symbols_count
					product_constituent_element_symbols_count.each do |symbol, count|
						product_element_symbols << symbol unless product_element_symbols.include? symbol
					end
				end
				reactant_element_symbols.sort! == product_element_symbols.sort!

			end

			def get_stoichiometric_coeff participant
				stoichiometric_coeff = participant.match(/^\d*/).to_a.first.to_i
			end
	end

end