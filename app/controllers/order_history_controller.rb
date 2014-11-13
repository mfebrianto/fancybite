class OrderHistoryController < TransactionsController

  def index
    @transaction_history = Transaction.where(customer_id: session['registered_customer_id'])
  end


end