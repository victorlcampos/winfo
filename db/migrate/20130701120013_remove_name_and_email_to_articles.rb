class RemoveNameAndEmailToArticles < ActiveRecord::Migration
  def up
    remove_column :articles, :name
    remove_column :articles, :email
  end

  def down
    add_column :articles, :name, :string
    add_column :articles, :email, :string
  end
end
