require 'spec_helper'

RSpec.describe Eulim::Chemistry::Reaction do
  R = Eulim::Chemistry::Reaction
  it 'unbalanced reaction should return false for is_balanced' do
    expect(R.new('Na3PO4 + 3HCl >> 3NaCl + 23H3PO4').is_balanced).to eq(false)
  end

  it 'Balanced reaction should return true' do
    expect(R.new('2H2 + O2 >> 2H2O').is_balanced).to eq(true)
  end

  it '2H >> C reaction should return false for is_valid' do
    expect(R.new('2H >> B').is_valid).to eq(false)
  end

  it 'H2 >> 2H rxn should return true for is_valid' do
    expect(R.new('H2 >> 2H').is_valid).to eq(true)
  end

  it '6CO2 + 6H2O >> C6H12O6 + 6O2, CO2, H2O are reactant and C6H12O6, O2 are products' do
    react_prod = {:reactants => [], :products => []}
    R.new('6CO2 + 6H2O >> C6H12O6 + 6O2').species.each do |specie, type_species|
      type_species.each do |type_specie|
        react_prod[specie] << type_specie[:compound].formula
      end
    end
    expect(react_prod[:reactants]).to include("CO2", "H2O")
    expect(react_prod[:products]).to include("C6H12O6", "O2")
  end

  it '10KCl03 >> As2 has stoichiometric_coeff 10 and 1' do
    expect(R.new('10KCl03 >> As2').species[:reactants].first[:stoichiometric_coeff]).to eq(10)
    expect(R.new('10KCl03 >> As2').species[:products].first[:stoichiometric_coeff]).to eq(1)
  end
  
end