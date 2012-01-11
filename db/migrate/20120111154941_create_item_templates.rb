class CreateItemTemplates < ActiveRecord::Migration
  def change
    create_table :item_templates do |t|
      t.string :description
      t.integer :min_hours
      t.integer :max_hours
    end
  end
end
