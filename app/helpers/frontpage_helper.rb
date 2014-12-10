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

  def is_login?
    session['registered_customer_id'].present?
  end

end