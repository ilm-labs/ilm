require_relative 'reactor'

module Ilm
  module Chemical
    module Reactors
      # This class is for cst reactors
      class ContinuousStirredTankReactor < Reactor
        def initialize(args = {})
          super args
        end

        def find_volume
          # accumulation is zero
          compound_formula = @reaction.rate_equation.split(' ').first.split('r').last
          ci = @input[:substance].species[compound_formula]
          co = @output[:substance].species[compound_formula]
          input = @input[:quantity] * ci[:weight_percent] /
                  (100 * ci[:compound].molar_mass)
          output = @output[:quantity] * co[:weight_percent] /
                   (100 * co[:compound].molar_mass)
          x = (input - output) / input
        end

        def self.humanized_name
          'Continuous stirred-tank reactor'
        end
      end
    end
  end
end
