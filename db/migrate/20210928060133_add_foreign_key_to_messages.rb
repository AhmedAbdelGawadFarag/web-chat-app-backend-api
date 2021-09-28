class AddForeignKeyToMessages < ActiveRecord::Migration[6.0]
  def change

    add_foreign_key(:messages, :rooms)

  end
end
