class CreateUserConfigs < ActiveRecord::Migration
  def change
    create_table :user_configs do |t|
      t.integer :user_id
      t.integer :rating_threshold
      t.boolean :opt_out_by_rating
      t.boolean :opt_out_by_review
      t.boolean :daily_digest_enabled
      t.timestamps
    end
  end
end
