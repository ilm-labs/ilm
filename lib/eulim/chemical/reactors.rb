module Eulim
  module Chemical
    # This module contains knowledge of chemical reactors
    # Ex: Batch, CSTR, PFR
    module Reactors
      CSTR = ContinuousStirredTankReactor
      Batch = BatchReactor
      PFR = PlugFlowReactor
    end
  end
end
