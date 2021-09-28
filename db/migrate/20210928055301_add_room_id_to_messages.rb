class AddRoomIdToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :room_id, :integer, null: false
  end
end
