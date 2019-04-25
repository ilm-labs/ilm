require 'spec_helper'

s = Ilm::Chemistry::Substance.new 'CaCO3' => 1, 'CO2' => 2, 'CaO' => 0.5
vr = Ilm::Chemical::Reactors::Reactor.new(
  input: { substance: s, quantity: 10.kg },
  output: { substance: s, quantity: 10.kg },
  volume: 10.l
)

b = Ilm::Chemistry::Reaction.new(equation: 'Na3PO4(g) + 3HCl(l) >> 3NaCl(s) + H3PO4(aq')
iv = Ilm::Chemistry::Reaction.new(equation: '2H(g) >> B')

RSpec.describe 'Ilm::Chemical::Reactors::Reactor#new' do
  it 'should initialize with correct volume' do
    expect(vr.volume).to eq(10.l)
    expect(Ilm::Chemical::Reactors::Reactor.new.volume).to eq(nil)
    expect { Ilm::Chemical::Reactors::Reactor.new(volume: 10).volume }
      .to raise_error(ArgumentError, 'Invalid volume')
    expect { Ilm::Chemical::Reactors::Reactor.new(volume: 10.m).volume }
      .to raise_error(ArgumentError, 'Invalid volume unit')
  end
  it 'should initialize with correct system' do
    expect(Ilm::Chemical::Reactors::Reactor.new.system).to eq(:open)
    expect(Ilm::Chemical::Reactors::Reactor.new(system: :anything).system).to eq(:anything)
  end
  it 'should initialize with correct reaction' do
    expect(Ilm::Chemical::Reactors::Reactor.new(reaction: b).reaction).to eq(b)
    expect(Ilm::Chemical::Reactors::Reactor.new.reaction).to eq(nil)
    expect { Ilm::Chemical::Reactors::Reactor.new(reaction: iv).reaction }
      .to raise_error(ArgumentError, 'Invalid reaction argument')
  end
  # %i[input output].each do |feed|
  #   it "should initialize with correct #{feed}" do
  #     expect(Ilm::Chemical::Reactors::Reactor.new.send(feed)).to eq(nil)
  #     expect do
  #       Ilm::Chemical::Reactors::Reactor.new(
  #         feed => { substance: 'c' }
  #       ).send(feed)
  #     end .to raise_error(ArgumentError, 'Invalid substance')
  #     expect do
  #       Ilm::Chemical::Reactors::Reactor.new(
  #         feed => { substance: s }
  #       ).send(feed)
  #     end .to raise_error(ArgumentError, 'Invalid quantity')
  #     expect do
  #       Ilm::Chemical::Reactors::Reactor.new(
  #         feed => { quantity: 10.kg }
  #       ).send(feed)
  #     end .to raise_error(ArgumentError, 'Invalid substance')
  #     expect do
  #       Ilm::Chemical::Reactors::Reactor.new(
  #         feed => { substance: s, quantity: 10 }
  #       ).send(feed)
  #     end .to raise_error(ArgumentError, 'Invalid quantity')
  #     expect do
  #       Ilm::Chemical::Reactors::Reactor.new(
  #         feed => { substance: s, quantity: 10.kl }
  #       ).send(feed)
  #     end .to raise_error(ArgumentError, 'Invalid quantity unit')
  #     expect(vr.send(feed)).to eq(substance: s, quantity: 10.kg)
  #   end
  # end
end

%i[input output].each do |feed|
  RSpec.describe "Ilm::Chemical::Reactors::Reactor##{feed}" do
    it "should initialize with correct #{feed}" do
      r = Ilm::Chemical::Reactors::Reactor.new
      r.send "#{feed}=", substance: s, quantity: 10.kg / 1.s
      expect(r.send(feed)).to eq substance: s, quantity: 10.kg / 1.s
    end
  end
end

RSpec.describe 'Ilm::Chemical::Reactors::Reactor#volume' do
  it 'should initialize with correct volume' do
    r = Ilm::Chemical::Reactors::Reactor.new
    r.volume = 10.l
    expect(r.volume).to eq 10.l
  end
end

RSpec.describe 'Ilm::Chemical::Reactors::Reactor#system' do
  it 'should initialize with correct system' do
    r = Ilm::Chemical::Reactors::Reactor.new
    r.system = :open
    expect(r.system).to eq :open
    r.system = :anythingas
    expect(r.system).to eq :anythingas
  end
end

# RSpec.describe 'Ilm::Chemical::Reactors::Reactor#reaction' do
#   it 'should initialize with correct input' do
#     r = Ilm::Chemical::Reactors::Reactor.new
#     r.volume = 10.l
#     expect(r.volume).to eq 10.l
#   end
# end

# it 'should initialize with correct reaction and input' do
#   expect do
#     Ilm::Chemical::Reactors::Reactor.new(reaction: b, input: { substance: s, quantity: '10kg' })
#   end.to raise_error(ArgumentError, 'Substance not in reaction')
# end
