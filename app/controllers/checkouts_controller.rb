class CheckoutsController < FreeController

  def index
    @order_details = OrderDetail.where(order_id: session['order_id']) unless session['order_id'].blank?

    @customer = Customer.new

    @customer.addresses.build # if it is not built first then it will return empty object.
  end

end