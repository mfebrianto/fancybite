class CreateOrder < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :payment_code
      t.string :name
    end
  end
end
