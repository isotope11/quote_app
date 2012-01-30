class AddXronoIdToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :xrono_id, :integer
  end
end
