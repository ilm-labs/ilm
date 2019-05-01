require 'spec_helper'

require 'ilm/chemistry'

Element = Ilm::Chemistry::Element

RSpec.describe Ilm::Chemistry::Element do
  let(:hydrogen) { Element.get_by_symbol 'H' }
  let(:helium) { Element.get_by_symbol 'He' }

  it 'A should raise error: Element not found' do
    expect { Element.get_by_symbol('A') }
      .to raise_error(NameError, 'element not found')
  end

  it 'get_by_symbo should raise error: NameError, "Invalid attribute"' do
    expect { Element.get_by_symbo('H') }
      .to raise_error(NameError, 'Invalid attribute')
  end

  context '#new_atom' do
    it 'should_call_atom_initializer_with_hydrogen_as_element' do
      expect(Atom).to receive(:new).with(element: hydrogen)
      hydrogen.new_atom
    end
    it 'should_call_atom_initializer_with_helium_as_element' do
      expect(Atom).to receive(:new).with(element: helium)
      helium.new_atom
    end
  end
end
