require 'spec_helper'

RSpec.describe Eulim::Chemistry::Substance do
  s = Eulim::Chemistry::Substance.new 'CaCO3' => 1, 'CO2' => 2, 'CaO' => 0.5

  it 'should collect species correctly' do
    expect(s.species).to include('CaCO3', 'CO2', 'CaO')
  end

  it 'should calculate weight percentages' do
    expect(s.species['CaCO3'][:weight_percent]).to eq(1.0 / 3.5 * 100)
    expect(s.species['CO2'][:weight_percent]).to eq(2.0 / 3.5 * 100)
    expect(s.species['CaO'][:weight_percent]).to eq(0.5 / 3.5 * 100)
  end

  it 'should have compound objects' do
    expect(s.species['CaCO3'][:compound].class).to eq(Eulim::Chemistry::Compound)
    expect(s.species['CaO'][:compound].formula).to eq('CaO')
  end
end
