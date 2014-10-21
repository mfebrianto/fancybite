class CheckoutsController < FreeController

  def index
    @order_details = OrderDetail.where(order_id: session['order_id']) unless session['order_id'].blank?
  end

end