class Customer < ActiveRecord::Base

  has_many :addresses
  has_many :transactions
  has_many :orders, through: :transactions

  accepts_nested_attributes_for :addresses

end