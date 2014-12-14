class TransactionsController < FrontpageController

  before_action :check_session, :except => [:join]

  def index
    order_detail
    if session['registered_customer_id'].blank?
      @customer_login = CustomerLogin.new
    else
      @registered_customer = RegisteredCustomer.find(session['registered_customer_id'])
      render action: 'login'
    end
  end

  def show_guest_checkout
    order_detail
    customer
  end

  def create
    @order = Order.find(session['order_id'])
    @order.customer_id = session['registered_customer_id']
    @order.commit_to_buy = true
    @order.commit_to_buy_at = Time.now
    @order.save
    clear_session
  end

  def login
    order_detail
    @customer_login = CustomerLogin.new(customer_login_params)

    if @customer_login.valid?
      @registered_customer = @customer_login.customer
      session['registered_customer_id'] = @customer_login.customer.id
    else
      render action: 'index'
    end

  end

  private

  def guest_customer
    params.has_key?(:customer)
  end

  def joining_customer
    params.has_key?(:registered_customer)
  end

  def customer_login_params
    params.require(:customer_login).permit(:email, :password)
  end

  def joining_customer_params
    params.require(:registered_customer).permit(:name, :email, :phone, :password, :password_confirmation, :id,
                                                addresses_attributes: [:address, :id])
  end

  def checkouts_params
    params.re quire(:customer).permit(:name, :email, :phone, addresses_attributes: [:address])
  end

  def order_detail
    @order = Order.find(session['order_id'])
    @order_details = OrderDetail.where(order_id: session['order_id']) unless session['order_id'].blank?
  end

  def customer
    @customer = Customer.new
    # @customer.addresses.build # if it is not built first then it will return empty object.
    Rails.logger.info ">>>>>>>>>>#{@customer.inspect}"
    # Rails.logger.info ">>>>>>>>>>#{@customer.addresses.inspect}"
  end

  def clear_session
    session.clear
  end

end