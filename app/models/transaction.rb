class Transaction < ActiveRecord::Base

  belongs_to :customer
  belongs_to :order

  before_create :unique_transaction_id
  after_create :send_email

  private

  def send_email
    OrderMailer.order_confirmation(customer).deliver
  end

  def unique_transaction_id
    self.transfer_key = SecureRandom.hex(3)
  end

end