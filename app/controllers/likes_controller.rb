class LikesController < ApplicationController
  def create
    article_id = params[:article_id]
    remote_ip = request.remote_ip

    Like.find_or_create_by_remote_ip_and_article_id(remote_ip, article_id)

    redirect_to article_path(article_id)
  end
end