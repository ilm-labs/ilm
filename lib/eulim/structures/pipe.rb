module Eulim
  module Structures
    # This is the class for Pipe
    # It inherits from Structure
    class Pipe < Structure
      def initialize(*args) end

      def self.requirements
        'gimme radius, length, thickness, material...'
      end
    end
  end
end
