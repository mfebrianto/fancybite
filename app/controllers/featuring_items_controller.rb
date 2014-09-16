class FeaturingItemsController < AuthController

  def index
    @featuring_items = FeaturingItem.all
    flash[:notice] = 'menu item successfully added to featuring items'

    respond_to do |format|
      format.js {render :layout=>false}
    end
  end

  def show
    flash[:notice] = 'menu item successfully added to featuring items'

    respond_to do |format|
      format.js {render :layout=>false}
    end
  end

  def create
    flash[:notice] = 'menu item successfully added to featuring items'

    respond_to do |format|
      format.js {render :layout=>false}
    end
  end

end