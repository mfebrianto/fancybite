class AddQuantityToOrderDetail < ActiveRecord::Migration
  def change
    add_column :order_details, :quantity, :numeric
  end
end
