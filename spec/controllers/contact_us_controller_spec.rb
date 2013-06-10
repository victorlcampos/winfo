require 'spec_helper'

describe ContactUsController do
  describe 'GET "new"' do
    it 'should returns http success' do
      get :new
      response.should be_success
    end

    it 'should assigns contact_us' do
      contact_us = {}
      ContactUs.stub(:new).and_return(contact_us)
      get :new
      assigns(:contact_us).should eq(contact_us)
    end
  end

  describe 'POST "create"' do

    context 'with valid params' do
      let(:valid_params) do
        {
          contact_us: {
            name: 'Derp',
            title: 'Hello Hello',
            email: 'contact@us.com',
            content: 'lorem ipsum'
          }
        }
      end
      before(:each) do
        post :create, valid_params
      end

      it 'should send a email' do
        ActionMailer::Base.deliveries.last.to.should == [Settings.contact_email]
      end

      it 'should redirect to home' do
        response.should redirect_to(root_path)
      end

      it 'should assigns flash with success' do
        flash[:success].should =~ /Obrigado por entrar em contato/i
      end
    end

    context 'with empty params' do
      let(:invalid_params) do
        {
          contact_us: {
            name: '',
            title: '',
            email: '',
            content: ''
          }
        }
      end
      before(:each) do
        post :create, invalid_params
      end

      it 'should redirect to home' do
        response.should render_template(:new)
      end

      context 'assigns contact_us errors' do
        it 'should contains name' do
          assigns(:contact_us).errors.include?(:name).should be_true
        end
        it 'should contains title' do
          assigns(:contact_us).errors.include?(:title).should be_true
        end
        it 'should contains email' do
          assigns(:contact_us).errors.include?(:email).should be_true
        end
        it 'should contains content' do
          assigns(:contact_us).errors.include?(:content).should be_true
        end
      end
    end
    context 'with invalid email' do
      let(:invalid_params) do
        {
          contact_us: {
            name: 'Derp',
            title: 'Hello Hello',
            email: 'contactus.com',
            content: 'lorem ipsum'
          }
        }
      end
      before(:each) do
        post :create, invalid_params
      end

      it 'should redirect to home' do
        response.should render_template(:new)
      end

      context 'assigns contact_us errors' do
        it 'should contains email' do
          assigns(:contact_us).errors.include?(:email).should be_true
        end
      end
    end
  end
end
