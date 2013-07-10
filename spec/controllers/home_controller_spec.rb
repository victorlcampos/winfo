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
    context 'newer' do
      before(:each) do
        get :index, order_by: nil
      end

      it 'should assings all articles' do
        assigns(:articles).should == [article_2, article_1]
      end
    end
    context 'most read' do
      before(:each) do
        article_1.views = 10
        article_1.save!
        get :index, order_by: "most_read"
      end
      it 'should assings all articles' do
        assigns(:articles).should == [article_1, article_2]
      end
    end
  end
end
