require 'spec_helper'

describe ContactUsMailer do
  let!(:contact_us) do
    contact_us = {}
    contact_us.stub(:name)    { 'Derp' }
    contact_us.stub(:title)   { 'Hello Hello' }
    contact_us.stub(:email)   { 'contact@us.com' }
    contact_us.stub(:content) { 'lorem ipsum' }
    contact_us
  end
  let(:mail) { ContactUsMailer.contact_us(contact_us) }

  before(:each) do
    Settings.stub(:contact_email) { 'contact@initialProject.com' }
  end

  it 'renders the subject' do
    mail.subject.should == contact_us.title
  end

  it 'renders the receiver email' do
    mail.to.should == [Settings.contact_email]
  end

  it 'renders the sender email' do
    mail.from.should == [contact_us.email]
  end

  it 'renders the content' do
    mail.body.encoded.should match(contact_us.content)
  end
end
