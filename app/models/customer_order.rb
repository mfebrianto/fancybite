class CustomerOrder < ActiveRecord::Base

  belongs_to :customer
  has_many :order_detail

  before_create :unique_transaction_id
  # after_create :send_email

  def check_whether_purchase_is_made
    if self.order_details.empty?
      errors.add(:name, 'You hasn\'t purchased anything yet')
    end
    self.order_details.empty?
  end

  private

  def send_email
    OrderMailer.order_confirmation(customer).deliver
  end

  def unique_transaction_id
    self.transfer_key = SecureRandom.hex(3)
  end

end