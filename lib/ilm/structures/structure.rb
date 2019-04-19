module Ilm
  module Structures
    # This is the base class for all structures
    class Structure
      def initialize(*args) end

      def self.requirements
        'gimme some stuff.'
      end
    end
  end
end
