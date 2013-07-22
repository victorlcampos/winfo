class LikesController < ApplicationController
  def create
    article_id = params[:article_id]
    remote_ip = request.remote_ip

    article = Article.find_by_permalink(article_id)

    Like.find_or_create_by_remote_ip_and_article_id(remote_ip, article.id)

    redirect_to article_path(article)
  end
end