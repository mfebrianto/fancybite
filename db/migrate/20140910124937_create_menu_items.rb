class CreateMenuItems < ActiveRecord::Migration
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :picture
      t.references :menu_category, index: true
      t.timestamps
    end
  end
end
