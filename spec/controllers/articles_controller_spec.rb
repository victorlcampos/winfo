require 'spec_helper'

describe ArticlesController do

  describe "GET 'show'" do
    let!(:article) { {} }

    before(:each) do
      Article.stub(:new) {article} 
      get :show
    end

    it "returns http success" do
      response.should be_success
    end

    it "should assign the article" do
      assigns(:articles).should == article
    end
  end

end
