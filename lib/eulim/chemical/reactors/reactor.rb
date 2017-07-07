module Eulim
  module Chemical
    module Reactors
      # This is the base class for the diff kinds of reactors
      class Reactor
        attr_accessor :system, :volume, :input, :output, :conversion

        def initialize(args = {})
          @volume = volume_if_valid(args[:volume]) if args[:volume]
          @system = args[:system] || :open
        end

        private

        def volume_if_valid(vol)
          begin
            vol = Unitwise(vol)
          rescue
            raise ArgumentError, 'Invalid volume argument'
          end
          return vol if vol.composition.to_h == { 'L' => 3 }
          raise ArgumentError, 'Invalid volume unit'
        end
      end
    end
  end
end
