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
end
