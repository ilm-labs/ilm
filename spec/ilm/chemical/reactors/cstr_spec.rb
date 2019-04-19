require 'spec_helper'
require './lib/ilm/chemical/reactors/continuous_stirred_tank_reactor'
require './lib/ilm/chemistry'


RSpec.describe Ilm::Chemical::Reactors::ContinuousStirredTankReactor do
  s1 = Ilm::Chemistry::Substance.new('H2' => 2)
  s2 = Ilm::Chemistry::Substance.new('H2' => 1, 'H' => 1)
  rxn = Ilm::Chemistry::Reaction.new(equation: 'H2 >> 2H', rate_equation: 'rH2 = k * cH2')
  input = { substance: s1, quantity: '10kg/s' }
  output = { substance: s2, quantity: '10kg/s' }
  rc = Ilm::Chemical::Reactors::ContinuousStirredTankReactor.new(reaction: rxn, input: input, output: output)
  it 'should give 1' do
    expect(rc.find_volume.value)
      .to eq(0.5)
  end
end
