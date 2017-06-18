require 'spec_helper'

RSpec.describe Eulim::Chemistry::Compound do
  C = Eulim::Chemistry::Compound
  it 'molecular mass for H is 1.0079' do
    expect(C.new('H').molecular_mass).to eq(1.0079)
  end
    
  it 'Constituents of KClO3 are "K","Cl", "O"' do
    const_elements = []
    C.new('KClO3').constituents.each do |const|
      const_elements << const[:element].symbol
    end
    expect(const_elements).to include('K','Cl','O')
  end

  it 'Constituent atoms with count for KClO3' do
    expect(C.new('KClO3').constituent_atoms).to include("K"=>1, "Cl"=>1, "O"=>3)
  end
end