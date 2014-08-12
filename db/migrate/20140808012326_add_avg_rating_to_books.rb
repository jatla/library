class AddAvgRatingToBooks < ActiveRecord::Migration
  def change
  	add_column :books, :avg_rating, :decimal, :precision => 3, :scale => 2
  end
end
