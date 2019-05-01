require 'spec_helper'
require './lib/ilm/chemical/reactors/batch_reactor'

RSpec.describe 'Ilm::Chemical::Reactors::Batch' do
  Batch = Ilm::Chemical::Reactors::BatchReactor

  it 'should_initialize_a_batch_reactor' do
    expect(Batch.new.class)
      .to eq(Batch)
  end

  it 'should_initialize_reactor_with_correct_system' do
    expect(Batch.new.system).to eq(:closed)
    expect(Batch.new(system: :anything).system).to eq(:closed)
  end
end
