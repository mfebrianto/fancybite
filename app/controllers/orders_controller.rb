class OrdersController < FreeController

  def create

    if session['order_id'].blank?
      order = Order.create
      order_id = order.id
      session['order_id'] = order.id
    else
      order_id = session['order_id']
    end

    order_detail = OrderDetail.new(quantity: orders_params[:quantity],
                                   menu_item_id: orders_params[:menu_item_id],
                                   order_id: order_id )
    order_detail.save
    @order_details = OrderDetail.where(order_id: session['order_id'])

    respond_to do |format|
      format.js {render :layout=>false}
    end
  end

  def destroy
    order_detail = OrderDetail.find(orders_params[:id])
    order_detail.delete

    @order_details = OrderDetail.where(order_id: session['order_id'])

    respond_to do |format|
      format.js {render :layout=>false}
    end
  end

  private

  def orders_params
    params.permit(:id, :quantity, :menu_item_id)
  end

end