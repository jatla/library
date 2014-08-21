class CreateFollowsJoinTable < ActiveRecord::Migration
  def change
  	create_table :follows, id: false do |t|
      t.integer :user_id
      t.integer :book_id
    end
  end
end
