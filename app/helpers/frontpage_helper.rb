module FrontpageHelper

  def active?(menu_category)
    return 'active' if menu_category.first?
  end

  def in?(menu_category)
    return 'in' if menu_category.first?
  end

end