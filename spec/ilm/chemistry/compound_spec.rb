require 'spec_helper'

RSpec.describe Ilm::Chemistry::Compound do
  C = Ilm::Chemistry::Compound
  it 'molecular_mass_for_H2SO4_is_98.0792' do
    expect(C.new('H2SO4').molecular_mass.value.round(4))
      .to eq(98.0792)
  end

  it 'Constituents_of_KClO3_are_"K",_"Cl",_"O"' do
    expect(C.new('KClO3').constituents).to include('K', 'Cl', 'O')
  end

  it 'Constituent_atoms_with_count_for_KClO3' do
    constituents = C.new('KClO3').constituents
    expect(constituents['K'][:atom_count]).to eq 1
    expect(constituents['Cl'][:atom_count]).to eq 1
    expect(constituents['O'][:atom_count]).to eq 3
  end
end
