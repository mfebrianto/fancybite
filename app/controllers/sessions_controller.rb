class SessionsController < FrontpageController

  def index

  end

  def login
    customer = Customer.find_by_email_and_password(customer_login_params[:email], customer_login_params[:password])
    if customer
      session['registered_customer_id']=customer.id
      redirect_to check_session_frontpage_index_url
    end
  end

  private

  def customer_login_params
    params.require(:customer_login).permit(:email, :password)
  end

end