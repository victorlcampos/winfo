require 'spec_helper'

describe 'home/index.html.erb' do
  context 'article' do
    before(:each) do
      @articles = [FactoryGirl.create(:article), FactoryGirl.create(:article)]
    end
    it 'should render article title' do
      assert_select 'article' do
        assert_select 'h1' do
          assert_select 'a', text: ''
        end
      end
    end
  end
end