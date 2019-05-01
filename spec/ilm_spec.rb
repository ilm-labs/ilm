require 'spec_helper'

RSpec.describe Ilm do
  it 'has_a_version_number' do
    expect(Ilm::VERSION).not_to be nil
  end
end
