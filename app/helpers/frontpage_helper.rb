module FrontpageHelper

  def active?(menu_category)
    return 'active' if menu_category.first?
  end

  def in?(menu_category)
    return 'in' if menu_category.first?
  end

  def active_menu?(controller_name, title)
    return 'active' if controller_name == title
  end

  def price_format(price)

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