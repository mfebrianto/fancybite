class Order < ActiveRecord::Base

  has_many :order_details
  has_many :transactions
  has_many :customers, through: :transactions

  def check_whether_purchase_is_made
    if self.order_details.empty?
      errors.add(:name, 'You hasn\'t purchased anything yet')
    end
    self.order_details.empty?
  end

end