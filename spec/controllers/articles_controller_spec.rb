require 'spec_helper'

describe ArticlesController do
  let!(:article) { FactoryGirl.build(:article) }
  let!(:user) { FactoryGirl.create(:user) }
  describe 'get "new"' do

    context 'with loged user' do
      before(:each) do
        Article.stub(:new) {article}
        sign_in user
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
      before(:each) do
        get :new
      end

      it 'should return http success' do
        response.should redirect_to(new_user_session_path)
      end
    end
  end

  describe 'post "create"' do
    context 'without logged user' do
      let!(:valid_params) do
        {
          article: {
            title: 'Hello World',
            body: 'Corpooooooooo......'
          }
        }
      end

      it 'should return http success' do
        post :create, valid_params
        response.should redirect_to(new_user_session_path)
      end
    end
    context 'with logged user' do
      before(:each) do
        sign_in user
      end

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
        it 'should have user' do
          assigns(:article).user.should eq(user)
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
  end

  describe "GET 'show'" do
    let!(:article) { FactoryGirl.build(:article) }

    before(:each) do
      Article.stub(:find_by_permalink).with('hello-world') { article }
      get :show, id: 'hello-world'
    end

    it "returns http success" do
      response.should be_success
    end

    it "should assign the article" do
      assigns(:article).should == article
    end
  end
end
