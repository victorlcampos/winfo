require 'spec_helper'

describe 'home/index.html.erb' do
  context 'article' do
    before(:each) do
      article_1 = FactoryGirl.create(:article, title: 'Title 1', body: 'Hello')
      article_2 = FactoryGirl.create(:article, title: 'Title 2', body: 'World')
      @articles = [article_1, article_2]
    end
    it 'should render articles title' do
      render
      assert_select 'article' do
        assert_select 'h1' do
          @articles.each do |article|
            assert_select 'a', text: article.title
          end
        end
      end
    end

    it 'should render articles description' do
      render
      assert_select 'article' do
          @articles.each do |article|
            assert_select 'h2', text: article.summary_body
        end
      end
    end

    it 'should render articles date' do
      render
      assert_select 'article' do
          @articles.each do |article|
            assert_select 'time', text: article.posted_at
        end
      end
    end

  end
end