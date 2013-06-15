require 'spec_helper'

describe ArticlesController do

  describe "GET 'show'" do
    let!(:article) { {} }

    before(:each) do
      Article.stub(:find).with("1") {article} 
      get :show, id: 1
    end

    it "returns http success" do
      response.should be_success
    end

    it "should assign the article" do
      assigns(:article).should == article
    end
  end

end
