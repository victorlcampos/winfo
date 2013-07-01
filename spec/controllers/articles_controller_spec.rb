require 'spec_helper'

describe ArticlesController do
  describe 'get "new"' do
    let!(:article) { {} }

    context 'with loged user' do
      before(:each) do
        Article.stub(:new) {article}
        get :new
      end

      it 'should return http success' do
        response.should be_success
      end

      it 'should assign new article' do
        assigns(:article).should eq(article)
      end
    end
    context 'without loged user' do
    end
  end

  describe 'post "create"' do
    context 'valid params' do
      let!(:valid_params) do
        {
          article: {
            title: 'Hello World',
            body: 'Corpooooooooo......'
          }
        }
      end

      before(:each) do
        post :create, valid_params
      end

      it 'should redirect to home' do
        response.should redirect_to(root_path)
      end

      it 'should persist article' do
        assigns(:article).should be_persisted
      end
    end
    context 'invalid params' do
      let!(:invalid_params) do
        {
          article: {
            title: '',
            body: ''
          }
        }
      end

      before(:each) do
        post :create, invalid_params
      end

      it 'should render to new' do
        response.should render_template("new")
      end

      it 'should persist article' do
        assigns(:article).should_not be_persisted
      end
    end
  end

  describe "GET 'show'" do
    let!(:article) { FactoryGirl.build(:article) }

    before(:each) do
      Article.stub(:find).with('1') {article}
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
