class FrontpageController < FreeController

  def check_session
    if ( session['registered_customer_id'] || session['customer_id'] ) && session['original_request'].blank?
      true
    elsif ( session['registered_customer_id'] || session['customer_id'] ) && !session['original_request'].blank?
      original_request = session['original_request']
      session['original_request'] = ''
      redirect_to original_request
    else
      session['original_request'] = request.original_url
      redirect_to sessions_url
    end
  end

  def index
    @featuring_items = FeaturingItem.all
    @menu_categories = MenuCategory.all
    @banner_menus = BannerMenu.all
    @order_details = OrderDetail.where(order_id: session['order_id'])
  end

  def show
    @menu_item = MenuItem.find(params[:id])
    @order_details = OrderDetail.where(order_id: session['order_id']) unless session['order_id'].blank?

    respond_to do |format|
      format.js {render :layout=>false}
    end
  end

end