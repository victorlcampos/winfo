require 'spec_helper'

describe 'contact_us/new.html.erb' do
  context 'from new action' do
    before(:each) do
      assign(:contact_us, ContactUs.new)
    end


    it 'should render contact_us form' do
      render
      assert_select 'form' do
        assert_select 'input[name=?]', 'contact_us[name]'
        assert_select 'input[name=?]', 'contact_us[title]'
        assert_select 'input[name=?]', 'contact_us[email]'
        assert_select 'textarea[name=?]', 'contact_us[content]'
      end
    end
  end

  context 'from create action' do
    let(:contact_us) { ContactUs.new }

    it 'with empty params' do
      contact_us.valid?
      assign(:contact_us, contact_us)
      render
      assert_select 'div.alert-error', 4
    end

    it 'with wrong email' do
      contact_us.name = 'Derp'
      contact_us.title = 'Love Derpina'
      contact_us.email = 'blah'
      contact_us.content = 'Marry me'
      contact_us.valid?
      assign(:contact_us, contact_us)
      render
      assert_select 'div.alert-error', 1
    end
  end

end