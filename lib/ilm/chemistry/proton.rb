module Ilm
  module Chemistry
    # A class for Electrons
    class Proton
      attr_reader :nucleus

      CHARGE = (1.60217646 * (10**-19)).C
      MASS = (1.672621898 * (10**-27)).kg

      def initialize(args = {})
        @nucleus = args[:nucleus] || args[:atom]&.nucleus
      end

      def atom
        @nucleus&.atom
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
