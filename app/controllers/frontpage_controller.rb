class FrontpageController < FreeController

  def index
    @featuring_items = FeaturingItem.all
    @menu_categories = MenuCategory.all
    @banner_menus = BannerMenu.all
  end

end