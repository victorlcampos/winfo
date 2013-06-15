class LikesController < ApplicationController
  def create
    article = Article.find(params[:article_id])
    article.likes = article.likes + 1
    article.save!
    redirect_to article_path(article)
  end
end