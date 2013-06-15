class ArticlesController < ApplicationController
  def show
  	@article = Article.find(params[:id])
    @article.views = @article.views + 1
    @article.save
  end
end
