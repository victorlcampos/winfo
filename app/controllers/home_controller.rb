class HomeController < ApplicationController
  def index
    if params[:order_by] == "most_read"
      @articles = Article.order("views DESC")
    else
      @articles = Article.order("created_at DESC")
    end
  end
end
