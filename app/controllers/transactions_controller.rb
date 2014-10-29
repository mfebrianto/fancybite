class TransactionsController < FreeController



  def index
    order_detail
    customer
  end

  def show_guest_checkout
    order_detail
    customer
  end

  def join_form
    order_detail
    customer
  end

  def create
    @order = Order.find(session['order_id'])
    @order_details = @order.order_details
    @customer = Customer.new(checkouts_params)
    if !@order.check_whether_purchase_is_made && @customer.save
      @transaction = Transaction.new(customer_id: @customer.id, order_id: session['order_id'])
      @transaction.save

      order = Order.create
      session['order_id'] = order.id
    else
      Rails.logger.info ">>>>>>>>>>>>>>#{@customer.errors.inspect}"
      render action: 'index'
    end

  end

  private

  def checkouts_params
    params.require(:customer).permit(:name, :email, :phone, addresses_attributes: [:address, :id])
  end

  def order_detail
    @order = Order.find(session['order_id'])
    @order_details = OrderDetail.where(order_id: session['order_id']) unless session['order_id'].blank?
  end

  def customer
    @customer = Customer.new
    @customer.addresses.build # if it is not built first then it will return empty object.
  end


end