class UpdateAllPermalinks < ActiveRecord::Migration
  def up
    Article.reset_column_information
    Article.find_each do |article|
      article.generate_permalink
    end
  end

  def down
    Article.find_each do |article|
      article.permalink = nil
      article.save!
    end
  end
end
