module Ilm
  module Chemical
    module Reactors
      # This is the base class for the diff kinds of reactors
      class Reactor
        attr_reader :system, :volume, :input, :output, :reaction

        # ATTRS = [:system, :volume, :input, :output, :rate_equation]

        def initialize(args = {})
          self.system = args[:system]
          self.volume = args[:volume] if args[:volume]
          self.input = args[:input] if args[:input]
          self.output = args[:output] if args[:output]
          self.reaction = args[:reaction] if args[:reaction]
        end

        def system=(sys)
          @system = sys || :open
        end

        def volume=(vol)
          @volume = volume_if_valid vol
        end

        def input=(inp)
          @input = feed_if_valid inp
        end

        def output=(out)
          @output = feed_if_valid out
        end

        def reaction=(rxn)
          @reaction = reaction_if_valid rxn
        end

        private

        def volume_if_valid(vol)
          raise ArgumentError, 'Invalid volume' unless vol.is_a? Unitwise::Measurement
          raise ArgumentError, 'Invalid volume unit' unless vol.composition.to_h == { 'L' => 3 }
          vol
        end

        def feed_if_valid(feed)
          raise ArgumentError, 'Invalid quantity' unless feed[:quantity].is_a? Unitwise::Measurement
          raise ArgumentError, 'Invalid substance' unless feed[:substance].is_a? Ilm::Chemistry::Substance

          dim = feed[:quantity].composition.to_h
          return feed if valid_feed_quantity_dimensions.include? dim

          raise ArgumentError, 'Invalid quantity unit'
        end

        def valid_feed_quantity_dimensions
          [{ 'M' => 1 }, { 'M' => 1, 'T' => -1 }]
        end

        def reaction_if_valid(r)
          # raise ArgumentError, 'Substance not in reaction' if
          #   @input && (
          #     r.species[:reactants].keys &
          #     @input[:substance].species.keys
          #   ).empty?
          return r if r.class == Ilm::Chemistry::Reaction && r.is_valid

          raise ArgumentError, 'Invalid reaction argument'
        end
      end
    end
  end
end
