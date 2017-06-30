module Eulim
  module Chemistry
    # This class has functionality for reaction
    # Ex: check for balanced rxn, validity of a rxn
    class Reaction
      attr_accessor :equation, :is_valid, :is_balanced, :species

      STATES = {
        '(s)' => 'solid', '(l)' => 'liquid',
        '(g)' => 'gaseous', '(aq)' => 'aqueous',
        '' => 'liquid'
      }.freeze

      def initialize(arg)
        @equation = arg
        @species = build_species
        @is_valid = valid_rxn?
        @is_balanced = balanced_rxn?
      end

      private

      def build_species
        r = {}
        result = {}
        r[:reactants], r[:products] = @equation.split('>>')
        r.each do |type, _type_species|
          result[type] = {}
          r[type].split('+').each do |specie|
            result[type].merge!(get_specie_info(specie.strip))
          end
        end
        result
      end

      def get_specie_info(specie)
        sc = get_stoichiometry specie
        st = get_state specie
        offset_sc = sc.zero? ? 0 : sc.to_s.length
        offset_st = st.empty? ? 0 : st.length
        specie_str = specie[offset_sc..(specie.length - offset_st - 1)]
        {
          specie_str => {
            compound: Compound.new(specie_str),
            stoichiometry: sc.zero? ? 1 : sc,
            state: STATES[st]
          }
        }
      end

      def balanced_rxn?
        bal = { reactants: {}, products: {} }
        @species.each do |type, type_species|
          type_species.each do |_specie, s_info|
            s_info[:compound].constituents.each do |sym, c_info|
              bal[type][sym] ||= 0
              bal[type][sym] += c_info[:atom_count] * s_info[:stoichiometry]
            end
          end
        end
        bal[:products] == bal[:reactants]
      end

      def valid_rxn?
        valid = {}
        @species.each do |type, type_species|
          valid[type] = []
          type_species.each do |_specie, info|
            info[:compound].constituents.each do |symbol, _count|
              valid[type] << symbol
            end
          end
        end
        valid[:reactants].sort.uniq == valid[:products].sort.uniq
      end

      def get_stoichiometry(specie)
        specie.match(/^\d*/).to_a.first.to_i
      end

      def get_state(specie)
        specie.match(/\((s|l|g|aq)\)$/).to_s
      end
    end
  end
end
