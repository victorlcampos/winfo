class RenameLikesToLikesCountInArticle < ActiveRecord::Migration
  def change
    rename_column :articles, :likes, :likes_count
  end
end
