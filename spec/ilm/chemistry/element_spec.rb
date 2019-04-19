require 'spec_helper'

RSpec.describe Ilm::Chemistry::Element do
  E = Ilm::Chemistry::Element
  it 'A should raise error: Element not found' do
    expect { E.get_by_symbol('A') }
      .to raise_error(NameError, 'element not found')
  end

  it 'get_by_symbo should raise error: NameError, "Invalid attribute"' do
    expect { E.get_by_symbo('H') }
      .to raise_error(NameError, 'Invalid attribute')
  end
end
