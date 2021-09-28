class RemoveReceiverIdFromMessages < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages,:receiver_id
  end
end
