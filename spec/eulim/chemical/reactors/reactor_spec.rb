require 'spec_helper'

s = Sub.new 'CaCO3' => 1, 'CO2' => 2, 'CaO' => 0.5
vr = Rct.new(input: { substance: s, quantity: '10 kg' },
             output: { substance: s, quantity: '10 kg' },
             volume: '10l')

b = Rxn.new('Na3PO4(g) + 3HCl(l) >> 3NaCl(s) + H3PO4(aq')
iv = Rxn.new('2H(g) >> B')

RSpec.describe 'Eulim::Chemical::Reactors::Reactor#new' do
  it 'should initialize with correct volume' do
    expect(vr.volume).to eq(Unitwise(10, 'l'))
    expect(Rct.new.volume).to eq(nil)
    expect { Rct.new(volume: '10').volume }
      .to raise_error(ArgumentError, 'Invalid volume')
    expect { Rct.new(volume: '10 m').volume }
      .to raise_error(ArgumentError, 'Invalid volume unit')
  end
  it 'should initialize with correct system' do
    expect(Rct.new.system).to eq(:open)
    expect(Rct.new(system: :anything).system).to eq(:anything)
  end
  it 'should initialize with correct reaction' do
    expect(Rct.new(reaction: b).reaction).to eq(b)
    expect(Rct.new.reaction).to eq(nil)
    expect { Rct.new(reaction: iv).reaction }
      .to raise_error(ArgumentError, 'Invalid reaction argument')
  end
  %i[input output].each do |feed|
    it "should initialize with correct #{feed}" do
      expect(Rct.new.send(feed)).to eq(nil)
      expect { Rct.new(feed => { substance: 'c' }).send(feed) }
        .to raise_error(ArgumentError, 'Invalid substance')
      expect { Rct.new(feed => { substance: s }).send(feed) }
        .to raise_error(ArgumentError, 'Invalid quantity')
      expect { Rct.new(feed => { quantity: '10 kg' }).send(feed) }
        .to raise_error(ArgumentError, 'Invalid substance')
      expect { Rct.new(feed => { substance: s, quantity: '10' }).send(feed) }
        .to raise_error(ArgumentError, 'Invalid quantity')
      expect { Rct.new(feed => { substance: s, quantity: '10 kl' }).send(feed) }
        .to raise_error(ArgumentError, 'Invalid quantity unit')
      expect(vr.send(feed)).to eq(substance: s, quantity: Unitwise('10kg'))
    end
  end
end

%i[input output].each do |feed|
  RSpec.describe "Eulim::Chemical::Reactors::Reactor##{feed}" do
    it "should initialize with correct #{feed}" do
      r = Rct.new
      r.send "#{feed}=", substance: s, quantity: '10kg/s'
      expect(r.send(feed)).to eq substance: s, quantity: Unitwise('10kg/s')
    end
  end
end

RSpec.describe 'Eulim::Chemical::Reactors::Reactor#volume' do
  it 'should initialize with correct volume' do
    r = Rct.new
    r.volume = '10l'
    expect(r.volume).to eq Unitwise(10, 'l')
  end
end

RSpec.describe 'Eulim::Chemical::Reactors::Reactor#system' do
  it 'should initialize with correct system' do
    r = Rct.new
    r.system = :open
    expect(r.system).to eq :open
    r.system = :anythingas
    expect(r.system).to eq :anythingas
  end
end

RSpec.describe 'Eulim::Chemical::Reactors::Reactor#reaction' do
  it 'should initialize with correct input' do
    r = Rct.new
    r.volume = '10l'
    expect(r.volume).to eq Unitwise(10, 'l')
  end
end

# it 'should initialize with correct reaction and input' do
#   expect do
#     Rct.new(reaction: b, input: { substance: s, quantity: '10kg' })
#   end.to raise_error(ArgumentError, 'Substance not in reaction')
# end
