require 'spec_helper'

describe HomeController do
  describe 'GET "index"' do
    let!(:article_1) { FactoryGirl.create(:article) }
    let!(:article_2) { FactoryGirl.create(:article) }

    before(:each) do
      get :index
    end

    it 'should returns http success' do
      response.should be_success
    end

    it 'should assings all articles' do
      assigns(:articles).should == [article_2, article_1]
    end
  end
end
