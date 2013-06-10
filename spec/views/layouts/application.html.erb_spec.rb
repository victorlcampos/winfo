require 'spec_helper'

describe 'layouts/application.html.erb' do
  it 'should render navbar' do
    render
    assert_select '.navbar'
  end
  context 'navbar' do
    it 'should render brand' do
      render
      assert_select '.navbar' do
        assert_select 'a.brand[href="/"]' do
          assert_select 'img[src="/assets/logo.png"]'
          assert_select 'span', text: 'Title'
        end
      end
    end

    describe 'dont have session' do
      it 'should render login dropdown menu' do
        render
        assert_select '.navbar' do
          assert_select '.dropdown-toggle[href="#"]' do
            assert_select 'span', text: 'Entrar'
            assert_select 'span.caret'
          end
          assert_select 'ul.dropdown-menu' do
            assert_select 'li' do
              assert_select 'a', text: 'Já possuo cadastro'
            end
            assert_select 'li.divider'
            assert_select 'li' do
              assert_select 'a', text: 'Cadastrar'
            end
          end
        end
      end
    end
  end

  context 'footer' do
    it 'should render footer' do
      render
      assert_select 'footer'
    end

    it 'should render contact_us' do
      render
      assert_select 'footer' do
        assert_select 'a[href="/contact_us/new"]', with_text: 'Fale Conosco'
      end
    end
  end
end