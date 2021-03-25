class AddRequestsToUser < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :requests,:users,column: :sender_id
    add_foreign_key :requests,:users,column: :receiver_id
  end
end
