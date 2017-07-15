Dir['./lib/eulim/chemical/reactors/*.rb'].each { |file| require file }

module Eulim
  module Chemical
    # This module contains knowledge of chemical reactors
    # Ex: Batch, CSTR, PFR
    module Reactors
    end
  end
end
