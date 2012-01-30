class AddProcessBooleanToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :processed, :boolean
  end
end
