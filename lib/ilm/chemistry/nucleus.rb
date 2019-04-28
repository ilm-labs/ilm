module Ilm
  module Chemistry
    # A class for Electrons
    class Nucleus
      attr_reader :protons, :neutrons, :atom, :element

      def initialize(args)
        @atom = args[:atom]
        @element = @atom&.element

        build_protons(args)
        build_neutrons(args)
      end

      def charge
        @protons.count * Proton::CHARGE +
          @neutrons.count * Neutron::CHARGE
      end

      def mass
        @protons.count * Proton::MASS +
          @neutrons.count * Neutron::MASS
      end

      private

      def build_protons(args)
        @protons = []
        no_of_protons = (args[:protons] || @element&.no_of_protons).to_i
        no_of_protons.times { @protons << Proton.new(self) }
      end

      def build_neutrons(args)
        @neutrons = []
        no_of_neutrons = (args[:neutrons] || @element&.no_of_neutrons).to_i
        no_of_neutrons.times { @neutrons << Neutron.new(self) }
      end
    end
  end
end
