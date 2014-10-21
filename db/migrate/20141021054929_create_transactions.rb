class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :customer_id
      t.string :order_id
    end
  end
end
