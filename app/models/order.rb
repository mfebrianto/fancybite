class Order < ActiveRecord::Base

  has_many :order_details
  has_many :transactions
  has_many :customers, through: :transactions

end