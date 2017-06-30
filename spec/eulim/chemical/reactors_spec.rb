require 'spec_helper'

RSpec.describe Eulim::Chemical::Reactors do
  it 'should initialize aliases' do
    expect(Eulim::Chemical::Reactors::Batch)
      .to eq(Eulim::Chemical::Reactors::BatchReactor)
    expect(Eulim::Chemical::Reactors::CSTR)
      .to eq(Eulim::Chemical::Reactors::ContinuousStirredTankReactor)
    expect(Eulim::Chemical::Reactors::PFR)
      .to eq(Eulim::Chemical::Reactors::PlugFlowReactor)
  end
end
