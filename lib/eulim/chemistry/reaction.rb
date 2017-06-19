module Eulim
  module Chemistry
    # This class has functionality for reaction
    # Ex: check for balanced rxn, validity of a rxn
    class Reaction
      attr_accessor :equation, :is_valid, :is_balanced, :species
      def initialize(arg)
        @equation = arg
        get_reactants_and_products
        @is_valid = valid_rxn?
        @is_balanced = balanced_rxn?
      end

     private

      def get_reactants_and_products(rxn_str = @equation)
        @species = {}
        @species[:reactants], @species[:products] = rxn_str.split('>>')
        @species.each do |type, type_species|
          @species[type] = @species[type].split('+')
          @species[type].each_with_index do |specie, idx|
            @species[type][idx] = get_specie specie
          end
        end
        @species
      end

      def get_specie(specie)
        specie = specie.strip
        sc = get_stoichiometric_coeff specie
        offset = sc.zero? ? 0 : sc.to_s.length
        {
          compound: Compound.new(specie[offset..specie.length]),
          stoichiometric_coeff: sc.zero? ? 1 : sc
        }
      end

      def balanced_rxn?
        bal = {}
        @species.each do |type, type_species|
          bal[type] = {}
          type_species.each do |specie|
            specie[:compound].constituent_atoms.each do |sym, cnt|
              count = cnt * specie[:stoichiometric_coeff]
              bal[type][sym] = bal[type][sym] ? bal[type][sym] + count : count
            end
          end
        end
        bal[:products] == bal[:reactants]
      end

      def valid_rxn?
        valid = {}
        @species.each do |type, type_species|
          type_species.each do |specie|
            specie[:compound].constituent_atoms.each do |symbol, _count|
              (valid[type] ? valid[type] : valid[type] = []) << symbol
            end
          end
        end
        valid[:reactants].sort.uniq == valid[:products].sort.uniq
      end

      def get_stoichiometric_coeff(specie)
        specie.match(/^\d*/).to_a.first.to_i
      end
    end
  end
end
