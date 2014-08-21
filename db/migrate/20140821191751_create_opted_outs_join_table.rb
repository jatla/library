class CreateOptedOutsJoinTable < ActiveRecord::Migration
  def change
  	create_table :opted_outs, id: false do |t|
      t.integer :user_id
      t.integer :book_id
      t.boolean :by_rating
      t.integer :rating_threshold
      t.boolean :by_review
    end
  end
end
