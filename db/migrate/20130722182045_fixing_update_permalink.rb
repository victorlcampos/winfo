class FixingUpdatePermalink < ActiveRecord::Migration
  def up
    Article.reset_column_information
    Article.find_each do |article|
      article.permalink = article.id
      article.save!
    end
  end

  def down
  end
end
