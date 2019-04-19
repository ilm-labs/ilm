Dir['./lib/ilm/chemical/reactors/*.rb'].each { |file| require file }

module Ilm
  module Chemical
    # This module contains knowledge of chemical reactors
    # Ex: Batch, CSTR, PFR
    module Reactors
    end
  end
end
