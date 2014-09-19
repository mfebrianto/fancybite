class FeaturingItemsController < AuthController

  def index
    @featuring_items = FeaturingItem.all
  end

  def show
    flash[:notice] = 'menu item successfully added to featuring items'

    respond_to do |format|
      format.js {render :layout=>false}
    end
  end

  def destroy
    Rails.logger.info ">>>>>>>>destroy"
  end

  def create
    featuring_item_interactor = FeaturingItemInteractor.new(menu_item_param)
    @featuring_item = featuring_item_interactor.featuring_item

    if @featuring_item.save
      Rails.logger.info ">>>>>>notice"
      flash.now[:notice] = 'menu item successfully added to featuring items'
    else
      flash.now[:error] = @featuring_item.errors.full_messages.join(', ')
    end

    respond_to do |format|
      format.js {render :layout=>false}
    end
  end

  private

  def menu_item_param
    params.require(:menu_item).permit(:id)
  end

end