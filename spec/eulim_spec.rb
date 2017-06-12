require "spec_helper"

RSpec.describe Eulim do
  it "has a version number" do
    expect(Eulim::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(true).to eq(true)
  end

  it "structure asks for some stuff" do
  	expect(Eulim::Structures::Structure.requirements).to eq("gimme some stuff.")
  end

  it "pipe asks for 4 things" do
  	expect(Eulim::Structures::Pipe.requirements).to eq("gimme radius, length, thickness, material...")
  end

  it "unbalanced reaction should return false for is_balanced" do
    expect(Eulim::Chemistry::Reaction.new("Na3PO4 + 3HCl >> 3NaCl + 23H3PO4").is_balanced).to eq(false)
  end

  it "2H >> C reaction should return false for is_valid" do
    expect(Eulim::Chemistry::Reaction.new("2H >> B").is_valid).to eq(false)
  end

  it "H2 >> 2H rxm should return true for is_valid" do
    expect(Eulim::Chemistry::Reaction.new("H2 >> 2H").is_valid).to eq(true)
  end
end
