require 'spec_helper'

describe 'layouts/application.html.erb' do
  let!(:user) { FactoryGirl.create(:user) }

  context 'head' do
    it 'should render title with Winfo' do
      render
      assert_select  'title', text: 'Winfo'
    end
  end

  context 'header' do
    it 'should render logo' do
      render
      assert_select 'a[href=?]', root_path, text: 'Winfo'
    end

    context 'logged in user' do
      before { view.stub(:user_signed_in?) { true } }
      before(:each) do
        sign_in user
        render
      end

      it 'should render new article link' do
        assert_select 'a[href=?]', new_article_path, text: 'Novo Artigo'
      end

      it 'should render new invitation link' do
        assert_select 'a[href=?]', new_user_invitation_path, text: 'Enviar Convite'
      end

      it 'should render logout link' do
        assert_select 'a[href=?]', destroy_user_session_path,
          text: 'Sair', method: :delete
      end
    end

    context 'user logged out' do
      before(:each) do
        render
      end

      it 'should render login link' do
        assert_select 'a[href=?]', new_user_session_path, text: 'Entrar'
      end
    end
  end

  context 'footer' do
    it 'should render Copyright' do
      render
      assert_select 'div.footer', text: 'Winfo.me - Copyright 2013'
    end
  end
end