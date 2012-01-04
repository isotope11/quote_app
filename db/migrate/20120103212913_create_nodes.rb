class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :type
      t.string :description
      t.decimal :estimation
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.timestamps
    end
  end
end
