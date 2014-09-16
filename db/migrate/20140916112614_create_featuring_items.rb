class CreateFeaturingItems < ActiveRecord::Migration
  def change
    create_table :featuring_items do |t|
      t.integer :sequence
      t.references :menu_item, index: true
    end
  end
end
