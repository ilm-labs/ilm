# frozen_string_literal: true

module Ilm
  module Chemistry
    # A class for Electrons
    class Neutron
      attr_reader :nucleus

      CHARGE = 0.0.C.freeze
      MASS = (1.674927471 * (10**-27)).kg.freeze

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
