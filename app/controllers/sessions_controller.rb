class SessionsController < FrontpageController

  def index

  end

  def login
    customer = Customer.find_by_email_and_password(customer_login_params[:email], customer_login_params[:password])
    if customer
      session['registered_customer_id']=customer.id


      # TODO : check request coming from which controller
      # open profile page if request coming from login_controller (or controller that intend to login)
      redirect_to check_session_frontpage_index_url
    end
  end

  private

  def customer_login_params
    params.require(:customer_login).permit(:email, :password)
  end

end