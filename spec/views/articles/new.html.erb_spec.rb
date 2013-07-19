require 'spec_helper'

describe 'articles/new.html.erb' do
  before(:each) do
    @article = Article.new
    render
  end

  it 'should render new form' do
    assert_select 'form'
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

  context 'markdown' do
    it 'should render the WMDs buttons' do
      assert_select '#wmd-button-bar'
    end

    it 'should render input textarea' do
      assert_select 'textarea#wmd-input'
    end

    it 'should render the preview' do
      assert_select '#wmd-preview'
    end
  end
end