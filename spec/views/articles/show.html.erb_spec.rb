require 'spec_helper'

describe "articles/show.html.erb" do
  context 'article' do
    let!(:user) { FactoryGirl.create(:user) }
    before(:each) do
      params = {
        title: 'Title 1',
        body: 'Hello',
        user: user
      }
      @article = FactoryGirl.create(:article, params)
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
      assert_select 'form[action=?]#like_form', article_likes_path(@article) do
        assert_select 'a.submitForm'
      end
    end

    it 'should render likes number' do
      render
      assert_select 'span', text: @article.likes_count
    end

  end
end
