module Eulim
  module Chemical
    module Reactors
      # This is the base class for the diff kinds of reactors
      class Reactor
        attr_accessor :system, :volume, :input, :output, :conversion

        def initialize(args = {})
          @volume = volume_if_valid(args[:volume]) if args[:volume]
          @system = args[:system] || :open
          @input = input_if_valid(args[:input]) if args[:input]
        end

        private

        def volume_if_valid(vol)
          begin
            vol = Unitwise vol
          rescue
            raise ArgumentError, 'Invalid volume'
          end
          return vol if vol.composition.to_h == { 'L' => 3 }
          raise ArgumentError, 'Invalid volume unit'
        end

        def input_if_valid(inp)
          raise ArgumentError, 'Invalid input substance' if inp[:substance].class != Subs
          begin
            inp[:quantity] = Unitwise inp[:quantity]
          rescue
            raise ArgumentError, 'Invalid input quantity'
          end
          dim = inp[:quantity].composition.to_h
          return inp if valid_input_quantity_compositions.include? dim
          raise ArgumentError, 'Invalid input quantity unit'
        end

        def valid_input_quantity_compositions
          [{ 'M' => 1 }, { 'M' => 1, 'T' => -1 }, {}, { 'T' => -1 }]
        end
      end
    end
  end
end
