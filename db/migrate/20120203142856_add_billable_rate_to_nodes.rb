class AddBillableRateToNodes < ActiveRecord::Migration
  def change
    add_column :nodes, :billable_rate, :decimal
  end
end
