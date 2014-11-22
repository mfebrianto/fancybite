class TransactionsController < FrontpageController

  before_action :check_session

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

  def join_form
    order_detail
    @registered_customer = RegisteredCustomer.new
    @registered_customer.addresses.build
  end

  def create
    @order = Order.find(session['order_id'])
    @order_details = @order.order_details

    save_result = false
    action = 'index'
    customer_id = 0
    if guest_customer
      @customer = Customer.new(checkouts_params)
      save_result = @customer.save
      action = 'show_guest_checkout'
      customer_id = @customer.id
    elsif joining_customer
      if joining_customer_params.has_key?(:id)
        @registered_customer = RegisteredCustomer.find(joining_customer_params[:id])
        save_result = @registered_customer.update_attributes(joining_customer_params)
        action = 'create'
      else
        @registered_customer = RegisteredCustomer.new(joining_customer_params)
        save_result = @registered_customer.save
        action = 'join_form'
      end
      customer_id = @registered_customer.id
    end

    if !@order.check_whether_purchase_is_made && save_result
      @transaction = Order.new(customer_id: customer_id, order_id: session['order_id'])
      @transaction.save

      order = Order.create
      session['order_id'] = order.id
    else
      render action: action
    end
  end

  def sign_out
    session['registered_customer_id'] = nil
    redirect_to action: 'index'
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
    params.require(:customer).permit(:name, :email, :phone, addresses_attributes: [:address])
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


end