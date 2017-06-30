require 'spec_helper'

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

  it '6CO2(g) + 6H2O(l) >> C6H12O6(l) + 6O2(g) should collect state correctly ' do
    r = '6CO2(g) + 6H2O(l) >> C6H12O6(l) + 6O2(g)'
    species = R.new(r).species
    expect(species[:reactants]["CO2"][:state]).to eq("gaseous")
  end
end
