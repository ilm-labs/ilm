require 'spec_helper'

RSpec.describe Ilm::Chemistry::Compound do
  C = Ilm::Chemistry::Compound
  it 'molecular mass for H2SO4 is 98.0792' do
    expect(C.new('H2SO4').molecular_mass.value.round(4))
      .to eq(98.0792)
  end

  it 'Constituents of KClO3 are "K","Cl", "O"' do
    expect(C.new('KClO3').constituents).to include('K', 'Cl', 'O')
  end

  it 'Constituent atoms with count for KClO3' do
    constituents = C.new('KClO3').constituents
    expect(constituents['K'][:atom_count]).to eq 1
    expect(constituents['Cl'][:atom_count]).to eq 1
    expect(constituents['O'][:atom_count]).to eq 3
  end
end
