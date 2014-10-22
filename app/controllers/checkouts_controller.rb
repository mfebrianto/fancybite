class CheckoutsController < FreeController



  def index
    @order_details = OrderDetail.where(order_id: session['order_id']) unless session['order_id'].blank?

    @customer = Customer.new

    @customer.addresses.build # if it is not built first then it will return empty object.
  end


  def create

    @customer = Customer.new(checkouts_params)
    @customer.save
    @transaction = Transaction.new(customer_id: @customer.id, order_id: session['order_id'])
    @transaction.save
    @transfer_key = generate_transfer_key

    order = Order.create
    session['order_id'] = order.id


  end

  private

  def checkouts_params
    params.require(:customer).permit(:name, :email, addresses_attributes: [:address, :id])
  end

  def generate_transfer_key
    '12323212'
  end

end