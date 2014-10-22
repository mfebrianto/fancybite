class AddPhoneToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :phone, :string
    add_column :customers, :password, :string
  end
end
