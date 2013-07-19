class HomeController < ApplicationController
  def index
    if selected_scope = params[:order_by]
      @articles = Article.send(selected_scope).includes(:user)
    else
      @articles = Article.order("created_at DESC").includes(:user)
    end
  end
end
