require 'spec_helper'

describe Like do
  context 'relationship' do
    it { should belong_to(:article) }
  end
end
