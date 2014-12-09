class RegistrationsController < FrontpageController

  def new
    order_detail
    @registered_customer = RegisteredCustomer.new
    @registered_customer.addresses.build
  end

  private

  def order_detail
    @order = Order.find(session['order_id'])
    @order_details = OrderDetail.where(order_id: session['order_id']) unless session['order_id'].blank?
  end

end