require 'matrix'

module Eulim
  module Chemistry
    # This class has functionality for reaction
    # Ex: check for balanced rxn, validity of a rxn
    class Reaction
      attr_accessor :equation, :is_valid, :species, :participants, :balanced_eqn

      STATES = { '(s)' => 'solid', '(l)' => 'liquid',
                 '(g)' => 'gaseous', '(aq)' => 'aqueous', '' => '' }

      def initialize(arg)
        @equation = arg
        @species = build_species
        @is_valid = valid_rxn?
        participant_elements
        @balanced_eqn = balance_rxn
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

      def participant_elements
        participants = []
        @species[:reactants].keys.each do |r|
          participants << @species[:reactants][r][:compound].constituents.keys
        end
        @participants = participants.flatten.uniq
      end

      def get_participant_row(participant)
        row = []
        @species.keys.each do |key|
          i = key == :reactants ? 1 : -1
          @species[key].keys.each do |specie|
            if specie.include? participant
              row << @species[key][specie][:compound].constituents[participant][:atom_count] * i
            else
              row << 0
            end
          end
        end
        row
      end

      def write_matrix
        @matrix = Matrix[]
        @participants.each do |participant|
          @matrix = Matrix.rows(@matrix.to_a << get_participant_row(participant))
        end
        @matrix
      end

      def balanced_coeff_array
        write_matrix
        null_space_array = @matrix.nullspace_array
        lcm = null_space_array.collect(&:denominator).reduce(1, :lcm)
        null_space_array.collect { |x| (x * lcm).to_i }
      end

      def balance_rxn
        exp = ''
        i = 0
        bal_coeff = balanced_coeff_array
        @species.keys.each do |key|
          @species[key].keys.each do |comp|
            coeff = bal_coeff[i] == 1 ? ' ' : ' ' + bal_coeff[i].abs.to_s
            state = STATES.key(@species[key][comp][:state])
            exp = exp + coeff + comp + state + ' +'
            i += 1
          end
          exp = key == :reactants ? exp.chomp('+') + '>>' : exp.chomp('+')
        end
        exp.strip
      end
    end
  end
end
