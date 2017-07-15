require 'spec_helper'
require './lib/eulim/chemical/reactors/continuous_stirred_tank_reactor'
require './lib/eulim/chemistry'


RSpec.describe Eulim::Chemical::Reactors::ContinuousStirredTankReactor do
  s1 = Eulim::Chemistry::Substance.new('H2' => 2)
  s2 = Eulim::Chemistry::Substance.new('H2' => 1, 'H' => 1)
  rxn = Eulim::Chemistry::Reaction.new(equation: 'H2 >> 2H', rate_equation: 'rH2 = k * cH2')
  input = { substance: s1, quantity: '10kg/s' }
  output = { substance: s2, quantity: '10kg/s' }
  rc = Eulim::Chemical::Reactors::ContinuousStirredTankReactor.new(reaction: rxn, input: input, output: output)
  it 'should give 1' do
    expect(rc.find_volume.value)
      .to eq(0.5)
  end
end
