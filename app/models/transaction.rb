class Transaction < ActiveRecord::Base

  belongs_to :customer
  belongs_to :order

  def self.unique_transaction_id
    SecureRandom.hex(3)
  end

end