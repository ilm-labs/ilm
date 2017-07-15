require_relative 'reactor'

module Eulim
  module Chemical
    module Reactors
      # This class is for cst reactors
      class PlugFlowReactor < Reactor
        def initialize(args = {})
          super args
        end
      end
    end
  end
end
