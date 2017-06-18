module Eulim
  module Chemistry
    # This class has functionality for reaction
    # Ex: check for balanced rxn, validity of a rxn
    class Reaction
      attr_accessor :equation, :is_valid, :is_balanced, :compounds
      def initialize(arg)
        @equation = arg
        get_reactants_and_products
        @is_valid = valid_rxn?
        @is_balanced = balanced_rxn?
      end

     private

      def get_reactants_and_products(rxn_str = @equation)
        @compounds = {}
        @compounds[:reactants], @compounds[:products] = rxn_str.split('>>')
        @compounds.each do |type, type_comps|
          @compounds[type] = @compounds[type].split('+')
          @compounds[type].each_with_index do |comp, idx|
            p 'printing comp', comp
            @compounds[type][idx] = get_compound comp
          end
        end
        @compounds
      end

      def get_compound(compound)
        p 'printing compound', compound
        sc = get_stoichiometric_coeff compound.strip!
        offset = sc.zero? ? 0 : sc.to_s.length
        {
          compound: Compound.new(compound[offset..compound.length]),
          stoichiometric_coeff: sc.zero? ? 1 : sc
        }
      end

      def balanced_rxn?
        bal = {}
        @compounds.each do |type, type_compounds|
          bal[type] = {}
          type_compounds.each do |compound|
            compound[:compound].constituent_atoms.each do |sym, cnt|
              count = cnt * compound[:stoichiometric_coeff]
              bal[type][sym] = bal[type][sym] ? bal[type][sym] + count : count
            end
          end
        end
        bal[:products] == bal[:reactants]
      end

      def valid_rxn?
        valid = {}
        @compounds.each do |type, type_compounds|
          type_compounds.each do |compound|
            compound[:compound].constituent_atoms.each do |symbol, _count|
              (valid[type] ? valid[type] : valid[type] = []) << symbol
            end
          end
        end
        valid[:reactants].sort.uniq == valid[:products].sort.uniq
      end

      def get_stoichiometric_coeff(participant)
        p 'printing participant', participant
        participant.match(/^\d*/).to_a.first.to_i
      end
    end
  end
end
