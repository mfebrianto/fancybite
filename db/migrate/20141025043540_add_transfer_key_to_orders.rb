class AddTransferKeyToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :transfer_key, :string
  end
end
