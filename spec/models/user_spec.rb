require 'spec_helper'

describe User do
  context 'validations' do
    it { should validate_presence_of :name }
  end
  context 'relationship' do
    it { should have_many(:articles) }
  end
end
