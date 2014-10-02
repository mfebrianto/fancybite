module FrontpageHelper

  def active?(menu_category)
    Rails.logger.info ">>>>>>>>>active"
    return 'active' if menu_category.first?
  end

  def in?(menu_category)
    return 'in' if menu_category.first?
  end

  def active_menu?(controller_name, title)
    Rails.logger.info ">>>>>>>>>>>#{controller_name}"
    return 'active' if controller_name == title
  end


end