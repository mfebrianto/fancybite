class FrontpageController < FreeController

  def index
    @featuring_items = FeaturingItem.all
    @menu_categories = MenuCategory.all
    @banner_menus = BannerMenu.all
  end

  def show

    @menu_item = MenuItem.find(params[:id])

    respond_to do |format|
      format.js {render :layout=>false}
    end
  end

end