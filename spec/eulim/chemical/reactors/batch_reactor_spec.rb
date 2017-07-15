require 'spec_helper'
require './lib/eulim/chemical/reactors/batch_reactor'

RSpec.describe 'Eulim::Chemical::Reactors::Batch' do
  Batch = Eulim::Chemical::Reactors::BatchReactor

  it 'should initialize a batch reactor' do
    expect(Batch.new.class)
      .to eq(Batch)
  end

  it 'should initialize reactor with correct system' do
    expect(Batch.new.system).to eq(:closed)
    expect(Batch.new(system: :anything).system).to eq(:closed)
  end
end
