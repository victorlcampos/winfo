class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.references :article
      t.string :remote_ip

      t.timestamps
    end
    add_index :likes, :article_id
  end
end
