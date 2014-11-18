class OrderDetail < ActiveRecord::Base

  belongs_to :customer_order
  belongs_to :menu_item

end