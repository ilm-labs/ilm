require 'spec_helper'

RSpec.describe Eulim::Chemical::Reactors::Reactor do
  Reactor = Eulim::Chemical::Reactors::Reactor

  it 'should initialize reactor with correct volume' do
    expect(Reactor.new(volume: '10 l').volume)
      .to eq(Unitwise(10, 'l'))
    expect(Reactor.new.volume).to eq(nil)
    expect { Reactor.new(volume: '10').volume }
      .to raise_error(ArgumentError, 'Invalid volume argument')
    expect { Reactor.new(volume: '10 m').volume }
      .to raise_error(ArgumentError, 'Invalid volume unit')
  end

  it 'should initialize reactor with correct system' do
    expect(Reactor.new.system).to eq(:open)
    expect(Reactor.new(system: :anything).system).to eq(:anything)
  end
end
