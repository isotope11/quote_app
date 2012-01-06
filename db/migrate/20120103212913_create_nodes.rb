class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.integer :quote_id

      t.string :type
      t.string :description
      t.integer :min_hours
      t.integer :max_hours

      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.timestamps
    end
  end
end
