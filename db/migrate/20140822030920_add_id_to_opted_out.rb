class AddIdToOptedOut < ActiveRecord::Migration
  def change
  	add_column :opted_outs, :id, :primary_key
  end
end
