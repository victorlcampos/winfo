require 'spec_helper'

describe "articles/show.html.erb" do
  context 'article' do
    before(:each) do
      @article = FactoryGirl.create(:article, title: 'Title 1', body: 'Hello')
    end

    it 'should render articles title' do
      render
      assert_select 'header' do
        assert_select 'h1' , text: @article.title
      end
    end

    it 'should render articles body' do
      render
      assert_select 'article' do
        assert_select 'p', text: @article.body
      end
    end

    it 'should render articles date' do
      render
      assert_select 'header' do
        assert_select 'time', text: @article.posted_entry
      end
    end

    it 'should render like button' do
      render
      assert_select 'form[action=?]#like_form', article_likes_path(@article.id) do
        assert_select 'a.submitForm'
      end
    end

  end
end
