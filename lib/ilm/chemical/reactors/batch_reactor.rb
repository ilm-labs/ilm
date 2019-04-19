require_relative 'reactor'

module Ilm
  module Chemical
    module Reactors
      # This class is for batch reactors
      # assumptions: well mixed, closed system
      class BatchReactor < Reactor
        def initialize(args = {})
          super args
          @system = args[:system] == :isolated ? :isolated : :closed
        end
      end
    end
  end
end
