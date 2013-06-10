require 'spec_helper'

describe 'home/index.html.erb' do
  context 'create form' do
    it 'should render sign up form' do
      render
      assert_select 'form' do
        assert_select 'input[name="user[name]"]'
        assert_select 'input[name="user[email]"]'
        assert_select 'input[name="user[password]"]'
        assert_select 'input[name="user[password_confirmation]"]'
      end
    end
  end
end