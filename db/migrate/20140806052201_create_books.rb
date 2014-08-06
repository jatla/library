class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :author
      t.string :isbn
      t.string :image
      t.boolean :is_active
      t.boolean :is_approved

      t.timestamps
    end
  end
end
