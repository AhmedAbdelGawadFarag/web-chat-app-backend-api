class CreateFriends < ActiveRecord::Migration[6.0]
  def change
    create_table :friends do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false
      t.timestamps
    end
    add_foreign_key :friends, :users, column: :user_id
    add_foreign_key :friends, :users, column: :friend_id
  end
end
