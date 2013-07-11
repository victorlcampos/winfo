require 'spec_helper'

describe HomeController do
  describe 'GET "index"' do
    let!(:article_1) { FactoryGirl.create(:article, likes_count: 4, views: 1) }
    let!(:article_2) { FactoryGirl.create(:article, likes_count: 2) }

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
        get :index, order_by: "most_read"
      end

      it 'should assings all articles' do
        assigns(:articles).should == [article_1, article_2]
      end
    end

    context 'most liked' do
      before(:each) do
        get :index, order_by: "most_liked"
      end

      it 'should assings all articles' do
        assigns(:articles).should == [article_1, article_2]
      end
    end
  end
end
