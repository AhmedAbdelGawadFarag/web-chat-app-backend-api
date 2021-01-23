class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :sender_id, null: false
      t.integer :receiver_id, null: false
      t.timestamps
    end
    add_foreign_key :messages,:users,column: :sender_id
    add_foreign_key :messages,:users,column: :receiver_id
  end
end
