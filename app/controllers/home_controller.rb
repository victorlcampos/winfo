class HomeController < ApplicationController
  def index
    if selected_scope = params[:order_by]
      @articles = Article.send(selected_scope)
    else
      @articles = Article.order("created_at DESC")
    end
  end
end
