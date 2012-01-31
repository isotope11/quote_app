class AddUuidToNodes < ActiveRecord::Migration
  def up
    add_column :nodes, :uuid, :string
    add_index :nodes, :uuid, unique: true
  end

  def down
    remove_index :nodes, :uuid
    remove_column :nodes, :uuid
  end
end
