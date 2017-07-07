require 'spec_helper'
require 'rubypython'

R = Eulim::Chemistry::Reaction

RSpec.describe Eulim::Chemistry::Reaction do
  it 'is_balanced? method should work' do
    expect(R.new('Na3PO4 + 3HCl >> 3NaCl + H3PO4').is_balanced).to eq(true)
    expect(R.new('Na3PO4 + 3HCl >> 3NaCl + 23H3PO4').is_balanced).to eq(false)

RSpec.describe Eulim::Chemistry::Reaction do
  R = Eulim::Chemistry::Reaction
  ub = R.new('Na3PO4 + 3HCl >> 3NaCl + 23H3PO4')
  b = R.new('Na3PO4 + 3HCl >> 3NaCl + H3PO4')
  iv = R.new('2H >> B')

  it 'should check if balanced' do
    expect(b.is_balanced).to eq(true)
    expect(ub.is_balanced).to eq(false)

  end

  it 'should validate' do
    expect(iv.is_valid).to eq(false)
    expect(b.is_valid).to eq(true)
    expect(ub.is_valid).to eq(true)
  end

  it 'should collect reactants and products' do
    expect(ub.species[:reactants]).to include('Na3PO4', 'HCl')
    expect(iv.species[:reactants]).to include('H')
  end

  it 'should collect stoichiometry' do
    expect(ub
      .species[:reactants]['Na3PO4'][:stoichiometry]).to eq(1)
    expect(ub
      .species[:products]['H3PO4'][:stoichiometry]).to eq(23)
  end

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
  end
end
