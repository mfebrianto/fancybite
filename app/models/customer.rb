class Customer < ActiveRecord::Base

  has_many :addresses
  has_many :transactions
  has_many :orders, through: :transactions

end