module Ilm
  module Chemistry
    # A class for Electrons
    class Electron
      attr_reader :atom, :spin

      CHARGE = (-1.60217646 * (10**-19)).C
      MASS = (9.10938356 * (10**-31)).kg

      def initialize(args)
        @spin = args[:spin] || [-1/2, +1/2].sample
        @atom = atom
      end

      def nucleus
        @atom&.nucleus
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
