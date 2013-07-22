require 'spec_helper'

describe LikesController do
  describe 'POST "create"' do
    let!(:article) { FactoryGirl.create(:article, likes_count: 0) }

    context 'with diferent ip' do
      before(:each) do
        request.stub(:remote_ip) { '127.0.0.1' }
        post :create, article_id: article.permalink
        request.stub(:remote_ip) { '127.0.0.2' }
        post :create, article_id: article.permalink
      end

      it 'should increase likes_count by two' do
        Article.find(article.id).likes_count.should eq(2)
      end

      it 'should create a like' do
        Like.count.should eq(2)
        Like.first.article.should eq(article)
      end

      it 'should save the remote ip' do
        Like.order('id ASC').first.remote_ip.should eq('127.0.0.1')
        Like.order('id ASC').last.remote_ip.should  eq('127.0.0.2')
      end
    end

    context 'with same ip' do
      before(:each) do
        request.stub(:remote_ip) { '127.0.0.1' }
        post :create, article_id: article.permalink
        post :create, article_id: article.permalink
      end

      it 'should increase likes_count by one' do
        Article.find(article.id).likes_count.should eq(1)
      end

      it 'should create a like' do
        Like.count.should eq(1)
        Like.first.article.should eq(article)
      end
    end
  end
end