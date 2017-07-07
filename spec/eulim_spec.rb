require 'spec_helper'

RSpec.describe Eulim do
  it 'has a version number' do
    expect(Eulim::VERSION).not_to be nil
  end

  it 'should initialize aliases' do
    expect(Ch).to eq(Eulim::Chemistry)
    expect(Elem).to eq(Ch::Element)
    expect(Comp).to eq(Ch::Compound)
    expect(Rxn).to eq(Ch::Reaction)
    expect(Sub).to eq(Ch::Substance)

    expect(Cl).to eq(Eulim::Chemical)
    expect(Rcts).to eq(Cl::Reactors)
    expect(Br).to eq(Rcts::Batch)
    expect(Cstr).to eq(Rcts::CSTR)
    expect(Pfr).to eq(Rcts::PFR)
  end
end
