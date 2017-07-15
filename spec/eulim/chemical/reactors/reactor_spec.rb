require 'spec_helper'

s = Eulim::Chemistry::Substance.new 'CaCO3' => 1, 'CO2' => 2, 'CaO' => 0.5
vr = Eulim::Chemical::Reactors::Reactor.new(input: { substance: s, quantity: '10 kg' },
             output: { substance: s, quantity: '10 kg' },
             volume: '10l')

b = Eulim::Chemistry::Reaction.new(equation: 'Na3PO4(g) + 3HCl(l) >> 3NaCl(s) + H3PO4(aq')
iv = Eulim::Chemistry::Reaction.new(equation: '2H(g) >> B')

RSpec.describe 'Eulim::Chemical::Reactors::Reactor#new' do
  it 'should initialize with correct volume' do
    expect(vr.volume).to eq(Unitwise(10, 'l'))
    expect(Eulim::Chemical::Reactors::Reactor.new.volume).to eq(nil)
    expect { Eulim::Chemical::Reactors::Reactor.new(volume: '10').volume }
      .to raise_error(ArgumentError, 'Invalid volume')
    expect { Eulim::Chemical::Reactors::Reactor.new(volume: '10 m').volume }
      .to raise_error(ArgumentError, 'Invalid volume unit')
  end
  it 'should initialize with correct system' do
    expect(Eulim::Chemical::Reactors::Reactor.new.system).to eq(:open)
    expect(Eulim::Chemical::Reactors::Reactor.new(system: :anything).system).to eq(:anything)
  end
  it 'should initialize with correct reaction' do
    expect(Eulim::Chemical::Reactors::Reactor.new(reaction: b).reaction).to eq(b)
    expect(Eulim::Chemical::Reactors::Reactor.new.reaction).to eq(nil)
    expect { Eulim::Chemical::Reactors::Reactor.new(reaction: iv).reaction }
      .to raise_error(ArgumentError, 'Invalid reaction argument')
  end
  %i[input output].each do |feed|
    it "should initialize with correct #{feed}" do
      expect(Eulim::Chemical::Reactors::Reactor.new.send(feed)).to eq(nil)
      expect { Eulim::Chemical::Reactors::Reactor.new(feed => { substance: 'c' }).send(feed) }
        .to raise_error(ArgumentError, 'Invalid substance')
      expect { Eulim::Chemical::Reactors::Reactor.new(feed => { substance: s }).send(feed) }
        .to raise_error(ArgumentError, 'Invalid quantity')
      expect { Eulim::Chemical::Reactors::Reactor.new(feed => { quantity: '10 kg' }).send(feed) }
        .to raise_error(ArgumentError, 'Invalid substance')
      expect { Eulim::Chemical::Reactors::Reactor.new(feed => { substance: s, quantity: '10' }).send(feed) }
        .to raise_error(ArgumentError, 'Invalid quantity')
      expect { Eulim::Chemical::Reactors::Reactor.new(feed => { substance: s, quantity: '10 kl' }).send(feed) }
        .to raise_error(ArgumentError, 'Invalid quantity unit')
      expect(vr.send(feed)).to eq(substance: s, quantity: Unitwise('10kg'))
    end
  end
end

%i[input output].each do |feed|
  RSpec.describe "Eulim::Chemical::Reactors::Reactor##{feed}" do
    it "should initialize with correct #{feed}" do
      r = Eulim::Chemical::Reactors::Reactor.new
      r.send "#{feed}=", substance: s, quantity: '10kg/s'
      expect(r.send(feed)).to eq substance: s, quantity: Unitwise('10kg/s')
    end
  end
end

RSpec.describe 'Eulim::Chemical::Reactors::Reactor#volume' do
  it 'should initialize with correct volume' do
    r = Eulim::Chemical::Reactors::Reactor.new
    r.volume = '10l'
    expect(r.volume).to eq Unitwise(10, 'l')
  end
end

RSpec.describe 'Eulim::Chemical::Reactors::Reactor#system' do
  it 'should initialize with correct system' do
    r = Eulim::Chemical::Reactors::Reactor.new
    r.system = :open
    expect(r.system).to eq :open
    r.system = :anythingas
    expect(r.system).to eq :anythingas
  end
end

RSpec.describe 'Eulim::Chemical::Reactors::Reactor#reaction' do
  it 'should initialize with correct input' do
    r = Eulim::Chemical::Reactors::Reactor.new
    r.volume = '10l'
    expect(r.volume).to eq Unitwise(10, 'l')
  end
end

# it 'should initialize with correct reaction and input' do
#   expect do
#     Eulim::Chemical::Reactors::Reactor.new(reaction: b, input: { substance: s, quantity: '10kg' })
#   end.to raise_error(ArgumentError, 'Substance not in reaction')
# end
