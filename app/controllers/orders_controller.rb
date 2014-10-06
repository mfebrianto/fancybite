class OrdersController < FreeController

  def create

    if session['order_id'].blank?

      order = Order.create
      order_detail = OrderDetail.new(quantity: orders_params[:quantity],
                                     menu_item_id: orders_params[:menu_item_id],
                                     order_id: order.id )
      order_detail.save

      session['order_id'] = order.id

    else

      Rails.logger.info ">>>>session['order_id']>>>>>>>#{session['order_id']}"

    end


    Rails.logger.info ">>>>order_detail>>>>>>>#{order_detail.inspect}"

    respond_to do |format|
      format.js {render :layout=>false}
    end
  end

  private

  def orders_params
    params.permit(:quantity, :menu_item_id)
  end

end