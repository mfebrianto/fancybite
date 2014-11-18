class CreateOrderDetail < ActiveRecord::Migration
  def change
    create_table :order_details do |t|
      t.string :menu_item_id
      t.string :transaction_id
    end
  end
end
