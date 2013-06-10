require 'spec_helper'

describe ContactUs do
  context 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:content) }

    it { should_not allow_value('blah').for(:email) }
    it { should allow_value('a@b.com').for(:email) }
  end

  subject do
    attributes = {
      name: 'Derp',
      title: 'Hello Hello',
      email: 'contact@us.com',
      content: 'lorem ipsum'
    }
    ContactUs.new(attributes)
  end

  context 'general methods' do
    its(:name)   { should eq('Derp') }
    its(:title)  { should eq('Hello Hello') }
    its(:email)  { should eq('contact@us.com') }
    its(:content) { should eq('lorem ipsum') }
  end

  context 'Active Model Methods' do
    describe '#persisted?' do
      its(:persisted?) { should be_false }
    end
  end

  describe '#send_contact' do
    before(:each) do
      Settings.stub(:contact_email) { 'contact@initialProject.com' }
    end

    it 'should send a email' do
      subject.send_contact
      ActionMailer::Base.deliveries.last.to.should == [Settings.contact_email]
    end
  end
end