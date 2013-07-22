class AddIndexToPermalink < ActiveRecord::Migration
  def change
    add_index :articles, :permalink
  end
end
