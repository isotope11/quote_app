class CreateNodes < ActiveRecord::Migration
  def change
    create_table :nodes do |t|
      t.string :type
      t.string :description
      t.decimal :estimation
      t.integer :section_id

      t.timestamps
    end
  end
end
