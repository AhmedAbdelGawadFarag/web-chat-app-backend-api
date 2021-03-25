class RenameRelationshipTable < ActiveRecord::Migration[6.0]
  def change
    rename_table(:relationships,:requests)

  end
end
