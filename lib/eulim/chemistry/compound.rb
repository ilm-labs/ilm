require 'unitwise'

module Eulim
  module Chemistry
    # This class has functionality for compounds
    # Ex: constituent elements, molecular mass, etc
    class Compound
      COMPOUND_REGEXP =
        /[A-Z][a-z]{0,2}\d*|\((?:[^()]*(?:\(.*\))?[^()]*)+\)\d*/

      attr_accessor :molecular_mass, :constituents, :formula, :constituent_atoms

      def initialize(arg)
        @formula = arg
        @constituents = get_constituents
        @molecular_mass = get_molecular_mass
        @constituent_atoms = get_const_atoms
      end

      private

      def get_molecular_mass
        mass = Unitwise(0, 'u')
        @constituents.each do |const|
          mass += const[:element].atomic_mass * const[:atom_count]
        end
        mass
      end

      def get_constituents
        constituents = []
        get_const_atoms.each do |symbol, count|
          constituents << {
            element: Element.get_by_symbol(symbol),
            atom_count: count
          }
        end
        constituents
      end

      def get_const_atoms(formula = @formula, r = {})
        formula.scan(COMPOUND_REGEXP).each do |const|
          multipler = get_multipler const
          if const[0] != '(' && multipler.zero?
            r[const] = r[const] ? r[const] + 1 : 1
          else
            (multipler.zero? ? 1 : multipler).times do
              sub_const = const.match(/^\(?(.*?)\)?($|\d*$)/).to_a
              get_const_atoms sub_const[const == sub_const.first ? 1 : 0], r
            end
          end
        end
        r
      end

      def get_multipler(const)
        multipler = const.match(/\d*$/).to_a.first.to_i
        multipler
      end
    end
  end
end
