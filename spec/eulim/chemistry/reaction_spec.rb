require 'spec_helper'
require 'rubypython'

<<<<<<< HEAD
R = Eulim::Chemistry::Reaction

RSpec.describe Eulim::Chemistry::Reaction do
  it 'is_balanced? method should work' do
    expect(R.new('Na3PO4 + 3HCl >> 3NaCl + H3PO4').is_balanced).to eq(true)
    expect(R.new('Na3PO4 + 3HCl >> 3NaCl + 23H3PO4').is_balanced).to eq(false)
=======
ub = Rxn.new(equation: 'Na3PO4(g) + 3HCl(l) >> 3NaCl(s) + 23H3PO4(aq)')
b = Rxn.new(equation: 'Na3PO4(g) + 3HCl(l) >> 3NaCl(s) + H3PO4(aq)')
iv = Rxn.new(equation: '2H(g) >> B')

RSpec.describe 'Eulim::Chemistry::Reaction#is_balanced' do
  it 'should check if balanced' do
    expect(b.is_balanced).to eq(true)
    expect(ub.is_balanced).to eq(false)
>>>>>>> d063ccc565e0687cc7b4b02e2f9905e1702f5b3d
  end
end

RSpec.describe 'Eulim::Chemistry::Reaction#is_valid' do
  it 'should validate' do
    expect(iv.is_valid).to eq(false)
    expect(b.is_valid).to eq(true)
    expect(ub.is_valid).to eq(true)
  end
end

RSpec.describe 'Eulim::Chemistry::Reaction#species' do
  it 'should collect reactants and products' do
    expect(ub.species[:reactants]).to include('Na3PO4', 'HCl')
    expect(iv.species[:products]).to include('B')
  end
end

RSpec.describe 'Eulim::Chemistry::Reaction#stoichiometry' do
  it 'should collect stoichiometry' do
    expect(ub
      .species[:reactants]['Na3PO4'][:stoichiometry]).to eq(1)
    expect(ub
      .species[:products]['H3PO4'][:stoichiometry]).to eq(23)
  end
end

<<<<<<< HEAD
  it 'H2(g) + O2(g) >> H2O(g) should collect state correctly ' do
    r = 'H2(g) + O2(g) >> H2O(g)'
    species = R.new(r).species
    expect(species[:reactants]['O2'][:state]).to eq('gaseous')
  end
end

RSpec.describe 'Eulim::Chemistry::Reaction#balancer' do
  it 'KMnO4 + HCl >> KCl + MnCl2 + H2O + Cl2 should be balanced' do
    r = 'KMnO4 + HCl >> KCl + MnCl2 + H2O + Cl2'
    expect(R.new(r).balance)
      .to eq('2KMnO4 + 16HCl >> 2KCl + 2MnCl2 + 8H2O + 5Cl2')
=======
RSpec.describe 'Eulim::Chemistry::Reaction#state' do
  it 'should collect state' do
    expect(ub.species[:reactants]['Na3PO4'][:state]).to eq('gaseous')
    expect(ub.species[:reactants]['HCl'][:state]).to eq('liquid')
    expect(ub.species[:products]['NaCl'][:state]).to eq('solid')
    expect(iv.species[:products]['B'][:state]).to eq('liquid')
>>>>>>> d063ccc565e0687cc7b4b02e2f9905e1702f5b3d
  end
end
