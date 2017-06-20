require 'spec_helper'
require 'unitwise'

RSpec.describe Eulim::Chemistry::Compound do
  C = Eulim::Chemistry::Compound
  it 'molecular mass for H2SO4 is 98.07919999999999' do
    expect(C.new('H2SO4').molecular_mass).to eq(Unitwise(98.0792, 'u'))
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