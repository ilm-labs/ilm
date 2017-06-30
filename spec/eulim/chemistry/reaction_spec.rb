require 'spec_helper'

RSpec.describe Eulim::Chemistry::Reaction do
  R = Eulim::Chemistry::Reaction
  ub = R.new('Na3PO4(g) + 3HCl(l) >> 3NaCl(s) + 23H3PO4(aq)')
  b = R.new('Na3PO4(g) + 3HCl(l) >> 3NaCl(s) + H3PO4(aq')
  iv = R.new('2H(g) >> B')

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

  it 'should collect state correctly ' do
    expect(ub.species[:reactants]['Na3PO4'][:state]).to eq('gaseous')
    expect(ub.species[:reactants]['HCl'][:state]).to eq('liquid')
    expect(ub.species[:products]['NaCl'][:state]).to eq('solid')
    expect(iv.species[:products]['B'][:state]).to eq('liquid')
  end
end
