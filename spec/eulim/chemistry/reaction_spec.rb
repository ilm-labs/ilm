require 'spec_helper'

RSpec.describe Eulim::Chemistry::Reaction do
  R = Eulim::Chemistry::Reaction

  it 'balancing should work' do
    expect(R.new('Na3PO4 + 3HCl >> 3NaCl + H3PO4').is_balanced).to eq(true)
    expect(R.new('Na3PO4 + 3HCl >> 3NaCl + 23H3PO4').is_balanced).to eq(false)
  end

  it 'validation should work' do
    expect(R.new('2H >> B').is_valid).to eq(false)
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
end
