class AddItemTemplateToNodes < ActiveRecord::Migration
  def change
    change_table :nodes do |t|
      t.integer :item_template_id
    end
  end
end
