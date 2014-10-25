class Customer < ActiveRecord::Base

  has_many :addresses
  has_many :transactions
  has_many :orders, through: :transactions

  accepts_nested_attributes_for :addresses

  validates_presence_of :name, :email, :phone

  validates_format_of :email, with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/

end