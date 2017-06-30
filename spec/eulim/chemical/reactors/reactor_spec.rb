require 'spec_helper'

RSpec.describe Eulim::Chemical::Reactors::Reactor do
  Reactor = Eulim::Chemical::Reactors::Reactor
  s = Subs.new 'CaCO3' => 1, 'CO2' => 2, 'CaO' => 0.5
  vr = Reactor.new(input: { substance: s, quantity: '10 kg' }, volume: '10l')
  it 'should initialize with correct volume' do
    expect(vr.volume).to eq(Unitwise(10, 'l'))
    expect(Reactor.new.volume).to eq(nil)
    expect { Reactor.new(volume: '10').volume }
      .to raise_error(ArgumentError, 'Invalid volume')
    expect { Reactor.new(volume: '10 m').volume }
      .to raise_error(ArgumentError, 'Invalid volume unit')
  end

  it 'should initialize with correct system' do
    expect(Reactor.new.system).to eq(:open)
    expect(Reactor.new(system: :anything).system).to eq(:anything)
  end

  it 'should initialize with correct input' do
    expect(Reactor.new.input).to eq(nil)
    expect { Reactor.new(input: { substance: 'c' }).input }
      .to raise_error(ArgumentError, 'Invalid input substance')
    expect { Reactor.new(input: { substance: s }).input }
      .to raise_error(ArgumentError, 'Invalid input quantity')
    expect { Reactor.new(input: { quantity: '10 kg' }).input }
      .to raise_error(ArgumentError, 'Invalid input substance')
    expect { Reactor.new(input: { substance: s, quantity: '10' }).input }
      .to raise_error(ArgumentError, 'Invalid input quantity')
    expect { Reactor.new(input: { substance: s, quantity: '10 kl' }).input }
      .to raise_error(ArgumentError, 'Invalid input quantity unit')
    expect(vr.input).to eq(substance: s, quantity: Unitwise('10kg'))
  end
end
