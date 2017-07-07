require 'spec_helper'

RSpec.describe Cstr do
  s1 = Sub.new('H2' => 2)
  s2 = Sub.new('H2' => 1, 'H' => 1)
  rxn = Rxn.new(equation: 'H2 >> 2H', rate_equation: 'rH2 = k * cH2')
  input = { substance: s1, quantity: '10kg/s' }
  output = { substance: s2, quantity: '10kg/s' }
  rc = Cstr.new(reaction: rxn, input: input, output: output)
  it 'should give 1' do
    expect(rc.find_volume.value)
      .to eq(0.5)
  end
end
