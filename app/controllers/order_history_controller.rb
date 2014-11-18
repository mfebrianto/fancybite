class OrderHistoryController < TransactionsController

  def index
    transaction_history
  end

  def show
    transaction_history
    @transaction = CustomerOrder.find(show_param)

    render action: 'index'
  end

  private

  def show_param
    params.require(:id)
  end

  def transaction_history
    @transaction_history = CustomerOrder.where(customer_id: session['registered_customer_id'])
  end

end