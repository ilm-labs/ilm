require 'spec_helper'
require 'rubypython'

R = Eulim::Chemistry::Reaction

RSpec.describe Eulim::Chemistry::Reaction do
  it 'is_balanced? method should work' do
    expect(R.new('Na3PO4 + 3HCl >> 3NaCl + H3PO4').is_balanced).to eq(true)
    expect(R.new('Na3PO4 + 3HCl >> 3NaCl + 23H3PO4').is_balanced).to eq(false)
  end

  it 'validation should work' do
    expect(R.new('2H >> B').is_valid).to eq(false)
    p 'here'
    expect(R.new('H2 >> 2H').is_valid).to eq(true)
  end

  it 'should collect reactants and products correctly' do
    r = '6CO2 + 6H2O >> C6H12O6 + 6O2'
    species = R.new(r).species
    expect(species[:reactants]).to include('CO2', 'H2O')
    expect(species[:products]).to include('C6H12O6', 'O2')
  end

  it 'should collect stoichiometry correctly' do
    r = '10KClO3 >> As2'
    expect(R.new(r)
      .species[:reactants]['KClO3'][:stoichiometry]).to eq(10)
    expect(R.new(r)
      .species[:products]['As2'][:stoichiometry]).to eq(1)
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
