class CreateCreateBooksTagsJoinTables < ActiveRecord::Migration
  def change
    create_table :book_tags, id: false do |t|
      t.integer :book_id
      t.integer :tag_id
    end
  end
end
