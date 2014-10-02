class CompleteMenuItemsController < FreeController

  layout 'frontpage'

  def index
    @banner_menus = BannerMenu.all
    @menu_categories = MenuCategory.all
  end

end