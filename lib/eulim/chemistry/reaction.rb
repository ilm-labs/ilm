module Eulim
  module Chemistry
    # This class has functionality for reaction
    # Ex: check for balanced rxn, validity of a rxn
    class Reaction
      attr_accessor :equation, :is_valid, :is_balanced, :species
      def initialize(arg)
        @equation = arg
        @species = get_species
        # @is_valid = valid_rxn?
        # @is_balanced = balanced_rxn?
      end

     private

      def get_species
        r = {}; result = {}
        r[:reactants], r[:products] = @equation.split('>>')
        r.each do |type, type_species|
          result[type] = {}
          r[type] = r[type].split('+')
          r[type].each do |specie|
            specie_info = get_specie_info specie
            result[type][specie_info.keys[0]] = {
              compound: Compound.new(specie_info.keys[0]),
              stoichiometric_coeff: specie_info.values[0]
            }
          end
        end
        result
      end

      def get_specie_info(specie)
        specie = specie.strip
        sc = get_stoichiometric_coeff specie
        offset = sc.zero? ? 0 : sc.to_s.length
        { specie[offset..specie.length] => sc.zero? ? 1 : sc }
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
