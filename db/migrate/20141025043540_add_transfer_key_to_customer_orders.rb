class AddTransferKeyToCustomerOrders < ActiveRecord::Migration
  def change
    add_column :customer_orders, :transfer_key, :string
  end
end
