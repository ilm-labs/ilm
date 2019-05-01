require 'spec_helper'
require 'rubypython'

ub = Ilm::Chemistry::Reaction.new(
  equation: 'NH3(g) + O2(g) >> NO(g) + H2O(g)',
  rate_equation: 'r_{CaO}=k[CaO][CO2]'
)
b = Ilm::Chemistry::Reaction.new(
  equation: 'Na3PO4(g) + 3HCl(l) >> 3NaCl(s) + H3PO4(aq)'
)
iv = Ilm::Chemistry::Reaction.new(equation: '2H(g) >> B')

# RSpec.describe 'Ilm::Chemistry::Reaction#is_balanced' do
#   it 'should_check_if_balanced' do
#     expect(b.is_balanced).to eq(true)
#     expect(ub.is_balanced).to eq(false)
#   end
# end

RSpec.describe 'Ilm::Chemistry::Reaction#is_valid' do
  it 'should_validate' do
    expect(iv.is_valid).to eq(false)
    expect(b.is_valid).to eq(true)
    expect(ub.is_valid).to eq(true)
  end
end

RSpec.describe 'Ilm::Chemistry::Reaction#species' do
  it 'should_collect_reactants_and_products' do
    expect(ub.species[:reactants]).to include('NH3', 'O2')
    expect(iv.species[:products]).to include('B')
  end
end

RSpec.describe 'Ilm::Chemistry::Reaction#stoichiometry' do
  it 'should_collect_stoichiometry' do
    expect(ub
      .species[:reactants]['NH3'][:stoichiometry]).to eq(1)
    expect(ub
      .species[:products]['NO'][:stoichiometry]).to eq(1)
  end
end

RSpec.describe 'Ilm::Chemistry::Reaction#state' do
  it 'should_collect_state' do
    expect(ub.species[:reactants]['NH3'][:state]).to eq('gaseous')
    expect(ub.species[:reactants]['O2'][:state]).to eq('gaseous')
    expect(ub.species[:products]['NO'][:state]).to eq('gaseous')
    expect(iv.species[:products]['B'][:state]).to eq('')
  end
end

RSpec.describe 'Ilm::Chemistry::Reaction#rate_equation' do
  it 'should_return_rate_equation' do
    expect(ub.rate_equation).to eq('rCaO=k * cCaO * cCO2')
  end
end
