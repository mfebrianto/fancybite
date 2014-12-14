class AddTimestampToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :created_at, :datetime
    add_column :orders, :updated_at, :datetime
    add_column :orders, :commit_to_buy, :boolean
    add_column :orders, :commit_to_buy_at, :datetime
  end
end
