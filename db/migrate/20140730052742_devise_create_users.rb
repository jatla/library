class DeviseCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|

      t.string :provider
      t.string :uid
      t.string :name
      t.string :avatar
      t.string :email

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end

    add_index :users, :email,                unique: true
  end
end
