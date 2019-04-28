module Ilm
  module Chemistry
    # A class for Electrons
    class Neutron
      attr_accessor :nucleus

      CHARGE = 0.0.C
      MASS = (1.674927471 * (10**-27)).kg

      def initialize(nucleus)
        @nucleus = nucleus
      end

      def charge
        CHARGE
      end

      def mass
        MASS
      end
    end
  end
end
