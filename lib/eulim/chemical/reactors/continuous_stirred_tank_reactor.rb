module Eulim
  module Chemical
    module Reactors
      # This class is for cst reactors
      class ContinuousStirredTankReactor < Reactor
        def initialize(args = {})
          super args
        end

        def self.humanized_name
          'Continuous stirred-tank reactor'
        end
      end
    end
  end
end
