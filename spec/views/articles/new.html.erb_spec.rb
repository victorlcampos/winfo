require 'spec_helper'

describe 'articles/new.html.erb' do
  before(:each) do
    @article = Article.new
    render
  end

  it 'should render new form' do
    assert_select 'form'
  end

  it 'should render name input' do
    assert_select 'form' do
      assert_select 'input[name=?]', 'article[name]'
    end
  end

  it 'should render email input' do
    assert_select 'form' do
      assert_select 'input[name=?]', 'article[email]'
    end
  end

  it 'should render title input' do
    assert_select 'form' do
      assert_select 'input[name=?]', 'article[title]'
    end
  end

  it 'should render body textarea' do
    assert_select 'form' do
      assert_select 'textarea[name=?]', 'article[body]'
    end
  end


end