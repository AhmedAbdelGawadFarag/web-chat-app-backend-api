class CreateUserRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :user_rooms do |t|
      t.integer :room_id, null: false
      t.integer :user_id, null: false
    end
  end
end
