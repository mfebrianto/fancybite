class FrontpageController < FreeController

  def index
    @featuring_items = FeaturingItem.all
    @menu_categories = MenuCategory.all
  end

end