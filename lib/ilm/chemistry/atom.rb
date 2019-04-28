module Ilm
  module Chemistry
    # This is a class for Atoms
    class Atom
      attr_reader :electrons, :protons, :neutrons, :nucleus, :element

      def initialize(args)
        @element = args[:element]

        @nucleus = Nucleus.new(args.merge(atom: self))
        @protons = @nucleus.protons
        @neutrons = @nucleus.neutrons

        build_electrons(args)
      end

      def charge
        @nucleus.charge + @electrons.count * Electron::CHARGE
      end

      def mass
        @nucleus.mass + @electrons.count * Electron::MASS
      end

      def element?
        Element.get_by_atomic_number @protons.count
      end

      private

      def build_electrons(args)
        @electrons = []
        no_of_electrons = (args[:electrons] || @element&.atomic_number).to_i
        no_of_electrons.times { @electrons << Electron.new(atom: self) }
      end
    end
  end
end
