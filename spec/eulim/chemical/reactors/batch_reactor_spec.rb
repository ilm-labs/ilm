require 'spec_helper'

RSpec.describe Eulim::Chemical::Reactors::Batch do
  Batch = Eulim::Chemical::Reactors::Batch

  it 'should initialize a batch reactor' do
    expect(Batch.new.class)
      .to eq(Eulim::Chemical::Reactors::Batch)
  end

  it 'should initialize reactor with correct system' do
    expect(Batch.new.system).to eq(:closed)
    expect(Batch.new(system: :anything).system).to eq(:closed)
  end
end
