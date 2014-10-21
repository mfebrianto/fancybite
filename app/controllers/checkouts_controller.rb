class CheckoutsController < FreeController

  def index
    @order_details = OrderDetail.where(order_id: session['order_id']) unless session['order_id'].blank?

    @customer = Customer.new

    @customer.addresses.build # if it is not built first then it will return empty object.
  end


  def create

    @customer = Customer.new(checkouts_params)

    Rails.logger.info ">>>>>>>>>>#{@customer.inspect}"
    Rails.logger.info ">>>>>>>>>>#{@customer.addresses.inspect}"
  end

  private

  def checkouts_params
    params.require(:customer).permit(:name, :email, addresses_attributes: [:address, :id])
  end

end