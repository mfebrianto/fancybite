class FrontpageController < FreeController

  def index
    @featuring_items = FeaturingItem.all
    @menu_categories = MenuCategory.all
    @banner_menus = BannerMenu.all
    Rails.logger.info ">>>>>>>>>>>>#{session['order_id']}"
    @order_details = OrderDetail.where(order_id: session['order_id'])
  end

  def show
    @menu_item = MenuItem.find(params[:id])
    @order_details = OrderDetail.where(order_id: session['order_id']) unless session['order_id'].blank?
    # @order_details = [@order_details] unless @order_details.kind_of?(Array)

    Rails.logger.info ">>>>>>>@order_details>>>>>>>#{@order_details}"

    respond_to do |format|
      format.js {render :layout=>false}
    end
  end

end