class AddTransferKeyToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :transfer_key, :string
  end
end
