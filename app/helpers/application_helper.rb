module ApplicationHelper

  def new?(instance_variable)
    instance_variable.new_record?
  end

  def subtotal(price, quantity)
    quantity * price
  end

  def total(order_details)
    total = 0
    Array(order_details).each do |order_detail|
      total += subtotal(order_detail.menu_item.price, order_detail.quantity)
    end
    total
  end
end
