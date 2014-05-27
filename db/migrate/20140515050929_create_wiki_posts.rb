class CreateWikiPosts < ActiveRecord::Migration
  def change
    create_table :wiki_posts do |t|
      t.integer :parent_id, :null => true
      t.string :name
      t.string :title
      t.text :raw_text
      t.text :processed_text

      t.timestamps
    end
    add_index :wiki_posts, [ :parent_id, :name ]
  end
end
